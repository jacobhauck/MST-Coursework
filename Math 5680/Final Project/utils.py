import matplotlib.pyplot as plt


def token_set(math_dataset, must_include=()):
  seen_tokens = set(must_include)
  for question, answer in math_dataset:
    # Just use lower-case characters as tokens
    seen_tokens.update(question.lower())
    seen_tokens.update(answer.lower())

  return tuple(sorted(seen_tokens))


def plot_length_histogram(dataset):
  q_lengths, a_lengths = [], []
  for q, a in dataset:
    q_lengths.append(len(q))
    a_lengths.append(len(a))


  plt.hist(q_lengths, density=True)
  plt.show()
  plt.hist(a_lengths, density=True)
  plt.show()
