from typing import List
import torch


class TokenEmbedding(torch.nn.Module):
  """
  Manages the conversion between three different token-string
  representations:

  1. String (human-readable) representation, e.g., 'What is 3 + 4?'

  2. Index (computer-readable) representation, e.g.,
  [start_index, i('W'), i('h'), i('a'), ..., i(' '), i('?'), end_index],
  where i is a function that maps a string representation to an integral
  index.

  3. Vector (ML embedding) representation, e.g.,
  [t(i1), t(i2), ... t(in)], where i1, i2, ..., in are the integral
  indices of the tokens, and t(i) is a vector in R^d for every index i

  - Use TokenEmbedding.indices to convert 1. -> 2.
  - Use TokenEmbedding.unembed to convert 2. -> 1.
  - Use TokenEmbedding.forward to convert 2. -> 3.

  The model decides how to convert 3. -> 2.
  """

  # Indices used for special tokens that are always included
  # in a token set
  start_index = 0
  end_index = 1
  pad_index = 2

  def __init__(self, tokens: List[str], d: int):
    """
    :param tokens: A list of tokens (as strings)
    :param d: Embedding dimension
    """
    super().__init__()

    self.d = d

    # <START> token is always 0, <END> token is always 1,
    # <PAD> token is always 2
    self.tokens = ('<START>', '<END>', '<PAD>') + tuple(tokens)

    # build mapping from token value to token index
    self.index = {t: i for i, t in enumerate(self.tokens)}

    # Store embedding matrix as a Parameter so that it can be
    # learned during training
    self.embedding_matrix = torch.nn.Parameter(
      torch.empty((self.num_tokens, d))
    )

    # I found it difficult to find suggestions on how to initialize
    # the embedding matrix, but PyTorch just samples from N(0,I)
    # (c.f. torch.nn.Embedding), so we will do this as well
    torch.nn.init.normal_(self.embedding_matrix)

  @property
  def num_tokens(self):
    return len(self.tokens)

  def indices(self, x: List[str]):
    """
    :param x: list of B strings of tokens, each of length n_i
    :return: tensor (B, n) of B sets of n token indices, where
    n = 2 + max_i n_i. Sequences are formed by prepending <start>
    tokens and appending <EOS> tokens. Sequences shorter than n tokens
    in length are padded with <pad> tokens
    """
    unpadded = [[self.index[t.lower()] for t in s] for s in x]
    n = max(map(len, unpadded))

    # pad sequences with <START>, <END> and <PAD> tokens
    padded = [
        [self.start_index]
        + s
        + [self.end_index]
        + [self.pad_index] * (n - len(s))
        for s in unpadded
    ]

    return torch.tensor(
        padded, dtype=torch.long, device=self.embedding_matrix.device
    )

  def unembed(self, indices, include_special: bool=False):
    """
    :param indices: (B, n) tensor B sets of n token indices
    :param include_special: Whether to include the special <START>, <END>
    and <PAD> tokens
    :return: the string corresponding to the given token indices
    """
    if include_special:
      return [''.join(self.tokens[i] for i in si) for si in indices]
    else:
      return [
          ''.join(
              self.tokens[i]
              for i in si[1 : si.tolist().index(self.end_index)]
          )
          for si in indices
      ]

  def forward(self, indices):
    """
    :param indices: (B, n) tensor of B sequences of n token indices
    :return: (B, n, d) tensor of B sets of embedded tokens
    """
    unscaled = self.embedding_matrix[indices, :]

    # Vaswani et al. scale embedding weights by sqrt(d)
    return unscaled * (self.d ** .5)


class PositionalEncoding(torch.nn.Module):
  """
  Performs a positional encoding on a sequence of tokens.
  Vaswani et al. section 3.5
  """

  def forward(self, x):
    """
    :param x: (B, n, d) tensor of B sets of n embedded tokens
    :return: (B, n, d) tensor of B sets of n embedded tokens with
    positional encoding
    """
    # make a matrix that is the sum of the input and the matrix of
    # sin and cos PE from 3.5

    # need to update pos

    pe = torch.zeros(x.size())
    _, n, d_model = x.size()

    # require d_model even to make our lives easy
    assert d_model % 2 == 0

    pos = torch.arange(n)
    i = torch.arange(d_model // 2)
    large_num = 10000 ** (2 * i / d_model)
    angle = pos[:, None] / large_num[None, :]
    pe[:, :, ::2] = torch.sin(angle)
    pe[:, :, 1::2] = torch.cos(angle)

    return x + pe.to(x.device)


class FeedForwardNetwork(torch.nn.Module):
  """
  A 2-layer feed-forward neural network.
  Vaswani et al. section 3.3
  """

  def __init__(self, d_model, d_ff):
    """
    :param d_model: dimension of input and output token embeddings
    :param d_ff: dimension of hidden layer
    """
    # use these dimensions for the architecture of FFN
    # (see 3.3 for details)
    self.d_model = d_model
    self.d_ff = d_ff

    super().__init__()
    self.hidden = torch.nn.Linear(d_model, d_ff)
    self.hidden2 = torch.nn.Linear(d_ff, d_model)

  def forward(self, x):
    """
    :param x: (B, n, d) tensor B sets of n of embedded tokens
    :return: (B, n, d) tensor B sets of n of tokens transformed by an MLP
    """
    x = torch.nn.functional.relu(self.hidden(x))
    x = self.hidden2(x)
    return x


class ScaledDotProductAttention(torch.nn.Module):
  """
  Scaled dot-product attention.
  Vaswani et al. section 3.2.1
  """

  def forward(self, queries, keys, values, mask=None):
    """
    :param queries: (B, n, d_a) tensor B sets of query token embeddings
    :param keys: (B, n, d_a) tensor B sets key token embeddings
    :param values: (B, n, d_a) tensor B sets of value embeddings
    :param mask: (B, n, n) tensor B sets of matrices of either 0 or -inf
    to mask out certain key/query relationships. None indicates a mask
    of all 0s (no masking)
    :return: (B, n, d_a) tensor of B sets of scaled dot-product
    attention of queries, keys and values with masking given by mask
    """
    if (mask == None):
      return torch.matmul(torch.nn.functional.softmax(torch.matmul(queries,torch.transpose(keys,1,2))/(keys.size()[2] ** .5),dim=2),values)
    else:
      return torch.matmul(torch.nn.functional.softmax(torch.add(mask,torch.matmul(queries,torch.transpose(keys,1,2))/(keys.size()[2] ** .5)),dim=2),values)


class MultiheadAttention(torch.nn.Module):
  """
  Multi-head attention.
  Vaswani et al. section 3.2.2
  """

  def __init__(self, h: int, d: int):
    """
    :param h: number of attention heads to use
    :param d: dimension of incoming token embeddings. Must have h | d
    """
    super().__init__()

    assert d % h == 0  # <=> h | d

    self.h = h
    self.d_head = d // h
    self.attention = ScaledDotProductAttention()

    self.query_projection = torch.nn.Linear(d, d, bias=False)
    self.key_projection = torch.nn.Linear(d, d, bias=False)
    self.value_projection = torch.nn.Linear(d, d, bias=False)
    self.concat_projection = torch.nn.Linear(d, d, bias=False)

  def forward(self, queries, keys, values, mask=None):
    """
    :param queries: (B, n_q, d) tensor B sets of query token embeddings
    :param keys: (B, n_k, d) tensor B sets key token embeddings
    :param values: (B, n_k, d) tensor B sets of value embeddings
    :param mask: (B, n_q, n_k) tensor B sets of matrices of either 0 or
    -inf to mask out certain key/query relationships. None indicates
    a mask of all 0s (no masking)
    :return: (B, n, d) tensor of B sets of multihead scaled
    dot-product attention of queries, keys and values with masking
    given by mask
    """
    # shapes of head inputs (B, n_i, h, d_head), i=q,k,v
    q_input_shape = queries.shape[:2] + (self.h, self.d_head)
    k_input_shape = keys.shape[:2] + (self.h, self.d_head)
    v_input_shape = keys.shape[:2] + (self.h, self.d_head)

    # get projections and split along embedding dimension
    queries = self.query_projection(queries).view(q_input_shape)
    keys = self.key_projection(keys).view(k_input_shape)
    values = self.value_projection(values).view(v_input_shape)

    # perform attention on each head
    mha = torch.cat([
      self.attention(
          queries[:, :, i, :], keys[:, :, i, :], values[:, :, i, :], mask
      )
      for i in range(self.h)
    ], dim=2)

    # output projection
    return self.concat_projection(mha)


class EncoderLayer(torch.nn.Module):
  """
  Transformer encoder layer.
  Vaswani et al. section 3.1
  """

  def __init__(
      self, ffn: FeedForwardNetwork, n_heads: int, p_dropout: float = 0.1
  ):
    """
    :param ffn: the feed-forward network
    :param n_heads: the number of attention heads to use in multihead
    attention
    :param p_dropout: dropout probability
    """
    super().__init__()

    self.dropout = torch.nn.Dropout(p_dropout)

    self.attention = MultiheadAttention(n_heads, ffn.d_model)
    self.layer_norm1 = torch.nn.LayerNorm(ffn.d_model)

    self.ffn = ffn
    self.layer_norm2 = torch.nn.LayerNorm(ffn.d_model)

  def forward(self, x, mask_in=None):
    """
    :param x: (B, n, d) tensor B sets of n token embeddings
    :param mask_in: (B, n, n) tensor of B matrices to mask out padding
    tokens
    :return: (B, n, d) tensor B sets of n token embeddings after one
    Transformer Encoder layer
    """
    y = self.dropout(self.attention(x, x, x, mask_in))
    x = self.layer_norm1(x + y)

    y = self.dropout(self.ffn(x))
    x = self.layer_norm2(x + y)

    return x


class DecoderLayer(torch.nn.Module):
  """
  Transformer decoder layer.
  Vaswani et al. section 3.1
  """

  def __init__(
      self, ffn: FeedForwardNetwork, n_heads: int, p_dropout: float = 0.1
  ):
    """
    :param ffn: the feed-forward network to use in the decoder
    :param n_heads: the number of attention heads to use in multihead
    attention
    :param p_dropout: dropout probability
    """
    super().__init__()

    self.dropout = torch.nn.Dropout(p_dropout)

    self.attention = MultiheadAttention(n_heads, ffn.d_model)
    self.layer_norm1 = torch.nn.LayerNorm(ffn.d_model)

    self.cross_attention = MultiheadAttention(n_heads, ffn.d_model)
    self.layer_norm2 = torch.nn.LayerNorm(ffn.d_model)

    self.ffn = ffn
    self.layer_norm3 = torch.nn.LayerNorm(ffn.d_model)

  def forward(self, x_in, x_out, output_mask=None, cross_mask=None):
    """
    :param x_in: (B, n_in, d) tensor B sets of n_in input token
    embeddings
    :param x_out: (B, n_out, d) tensor B sets of n_out output token
    embeddings
    :param output_mask: (B, n_out, n_out) tensor B sets of matrices to
    mask out certain relationships between output tokens (to prevent
    backward flow of information during training). A value of None
    indicates no masking
    :param cross_mask: (B, n_out, n_in) tensor B sets of matrices to mask
    out input padding tokens in cross attention
    :return: (B, n_out, d) tensor B sets of n_out output embeddings after
    one Transformer decoder layer
    """
    x = x_out

    y = self.dropout(self.attention(x, x, x, output_mask))
    x = self.layer_norm1(x + y)

    y = self.dropout(self.cross_attention(x, x_in, x_in, cross_mask))
    x = self.layer_norm2(x + y)

    y = self.dropout(self.ffn(x))
    x = self.layer_norm3(x + y)

    return x


class Transformer(torch.nn.Module):
  """
  Complete implementation of the transformer model in Vaswani et al.
  """

  def __init__(
      self,
      token_embedding: TokenEmbedding,
      max_output_length: int,
      n_encoder_layers: int,
      n_decoder_layers: int,
      n_heads: int,
      d_ff: int,
      p_dropout: float = 0.1
  ):
    """
    :param token_embedding: The TokenEmbedding object to use for token
    embedding
    :param max_output_length: The maximum sequence length (excluding
    <START> and <END> tokens) to generate during inference.
    :param n_encoder_layers: How many encoder layers to use
    :param n_decoder_layers: How many decoder layers to use
    :param n_heads: number of attention heads to use in multihead
    attention
    :param d_ff: dimension of feed-forward networks in encoder/decoder
    layers
    :param p_dropout: Dropout probability
    """
    super().__init__()

    self.max_output_length = max_output_length
    self.token_embedding = token_embedding
    self.positional_encoding = PositionalEncoding()
    self.dropout = torch.nn.Dropout(p_dropout)

    self.encoder_layers = torch.nn.ModuleList([
        EncoderLayer(
            FeedForwardNetwork(self.token_embedding.d, d_ff),
            n_heads, p_dropout
        )
        for _ in range(n_encoder_layers)
    ])

    self.decoder_layers = torch.nn.ModuleList([
        DecoderLayer(
            FeedForwardNetwork(self.token_embedding.d, d_ff),
            n_heads, p_dropout
        )
        for _ in range(n_decoder_layers)
    ])

  def input_attention_mask(self, input_indices):
    """
    :param input_indices: (B, n) tensor of B sets of input indices
    to make an input attention mask for
    :return: (B, n, n) mask that ignores padding tokens in input
    """
    if self.training:
      # only need to mask *columns* involving padding tokens in the
      # attention matrix. Values generated from the unmasked rows will
      # be masked in subsequent layers (and in cross-atttention layers).
      b, n = input_indices.shape
      col_mask = torch.where(
          input_indices == self.token_embedding.pad_index,
          -float('inf'), 0.
      ).view(b, 1, n)

      return torch.broadcast_to(col_mask, (b, n, n))

  def cross_attention_mask(self, input_indices, output_indices):
    """
    :param input_indices: (B, n_in) tensor of B sets of input token
    indices
    :param output_indices: (B, n_out) tensor of B sets of output token
    indices
    :return: (B, n_out, n_in) mask that ignores padding tokens in input
    """
    # in cross attention, the inputs are used as keys and values, so
    # masking out columns in the attention matrix will deal with padding
    # tokens in both
    # keys and values
    (b, n_in), n_out = input_indices.shape, output_indices.shape[1]
    col_mask = torch.where(
        input_indices == self.token_embedding.pad_index,
        -float('inf'), 0.
    ).view(b, 1, n_in)

    return torch.broadcast_to(col_mask, (b, n_out, n_in))

  def output_attention_mask(self, output_indices):
    """
    :param output_indices: (B, n) tensor of B sets of output indices
    to make an output self-attention mask for
    :return: (B, n, n) attention mask that masks out attention between
    tokens and subsequent tokens as well as padding tokens
    """
    # for output attention, we need to mask *columns* to the right
    # of the diagonal as well as *columns* that correspond to
    # padding tokens
    b, n = output_indices.shape
    col_mask = torch.where(
        output_indices == self.token_embedding.pad_index,
        -float('inf'), 0.
    ).view(b, 1, n)
    pad_mask = torch.broadcast_to(col_mask, (b, n, n))

    # ignoring future output tokens results in an upper-triangular mask
    flow_mask = torch.triu(
        -float('inf') * torch.ones_like(pad_mask), diagonal=1
    )

    # logical OR <-> addition when False <-> 0 and True <-> -inf
    return pad_mask + flow_mask

  def next_token(
      self, input_encoding, output_pe, output_mask=None, cross_mask=None
  ):
    """
    :param input_encoding: (B, n_in, d) input token encoding
    :param output_pe: (B, n_out, d) output token embedding with
    positional encoding
    :output_mask: (B, n_out, n_out) mask for output attention
    :cross_mask: (B, n_out, n_in) mask for cross attention
    :return: (B, num_tokens, n_out) tensor B sets of next-token
    scores (logits) for each output token
    """
    
    x = output_pe
    for decoder in self.decoder_layers:
      x = decoder(input_encoding, x, output_mask, cross_mask)

    # use embedding matrix as projection to token scores
    scores = torch.einsum('ijk,lk', x, self.token_embedding.embedding_matrix)

    # return logits, as PyTorch will compute the softmax in
    # CrossEntropyLoss for us. Note that CrossEntropyLoss requires num_tokens
    # dimension to be the second dimension, so we need to transpose
    scores = torch.transpose(scores, 1, 2)

    # set padding token score to -inf
    scores[:, self.token_embedding.pad_index, :] = -1000.

    return scores

  def forward(self, x: List[str] | str, y: List[str] | None=None):
    """
    :param x: list of B strings of input tokens during training. A single
    string during inference.
    :param y: list of B string of ground-truth output tokens. If provided,
    the model uses the ground-truth output tokens to compute next-token
    probabilities (masking out future output tokens). This is used
    for training and also to evaluate accuracy during testing.
    :return: Depends on whether y is given or not.
    if y is not None:
      (prob, actual)
        prob: (B, n_tokens, n_out - 1) B matrices of predicted next-token
        logit scores; prob[b, j, i] = log of probability that output token
        i is token j given first i output tokens within question-answer
        pair b
        actual: (B, n_out - 1) tensor B sets of actual next-token indices

    if y is None:
      prediction: Predicted output string
    """
    if y is None:
      x = [x]

    input_indices = self.token_embedding.indices(x)
    input_embedding = self.token_embedding(input_indices)
    input_pe = self.dropout(self.positional_encoding(input_embedding))
    input_mask = self.input_attention_mask(input_indices)

    input_encoding = input_pe
    for encoder_layer in self.encoder_layers:
       input_encoding = encoder_layer(input_encoding, input_mask)

    if y is not None:
      output_indices = self.token_embedding.indices(y)
      output_embedding = self.token_embedding(output_indices)
      output_pe = self.dropout(self.positional_encoding(output_embedding))
      output_mask = self.output_attention_mask(output_indices)
      cross_mask = self.cross_attention_mask(input_indices, output_indices)

      # just do one forward pass to get next-token log-probabilities
      prob = self.next_token(input_encoding, output_pe, output_mask, cross_mask)

      # actual is just the output indices shifted left 1
      # make sure to drop the last probability output
      return prob[..., :-1], output_indices[:, 1:]

    else:
      # initialize output with a <start> token
      output_indices = torch.tensor(
          [[self.token_embedding.start_index]],
          dtype=torch.long, device=input_encoding.device
      )

      # autoregressively compute next tokens
      while True:
        output_embedding = self.token_embedding(output_indices)
        output_pe = self.positional_encoding(output_embedding)

        # get next-token scores, take only last prediction (we don't
        # care about scores for already-generated tokens)
        prob = self.next_token(input_encoding, output_pe)[0, :, -1]

        # append most likely token to current output
        best_token_index = prob.argmax()
        next_token = torch.tensor(
            [[best_token_index]],
            dtype=torch.long, device=input_encoding.device
        )
        output_indices = torch.cat([output_indices, next_token], dim=1)

        # return if we reach the maximum output length or if the model emits
        # an <EOS> token
        if best_token_index == self.token_embedding.end_index:
          final_indices = output_indices.cpu()
          break

        elif output_indices.shape[1] == self.max_output_length + 1:
          # if we hit max length, then make sure to add an <EOS> token
          final_indices = torch.cat([
              output_indices.cpu(),
              torch.tensor([[self.token_embedding.end_index]])
          ], dim=1)
          break

      # convert token indices back to string
      return self.token_embedding.unembed(final_indices)[0]
