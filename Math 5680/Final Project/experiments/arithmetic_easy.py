"""
The experiment on the easy arithmetic dataset.
"""


class ArithmeticEasyExperiment:
    """
    Runs the experiment with the easy arithmetic dataset.
    """

    def __init__(self, db_path):
        """
        :param db_path: Path relative to models folder in which to save data
        related to the experiment.
        """
        # defer imports to speed up CLI script
        import torch.utils.data

        from math_dataset import MathDataset
        from training import QATransformerTrainer, SavePeriodicallyCallback, \
            make_loss_fn
        from transformer import Transformer, TokenEmbedding

        # Load token set
        with open('tokens.txt', 'r') as f:
            arithmetic_easy_tokens = f.read().splitlines()

        # Create model
        self.model = Transformer(
            TokenEmbedding(arithmetic_easy_tokens, 128),
            30, 5, 5, 2, 512, p_dropout=.025
        ).cuda()

        # Load arithmetic easy dataset
        arithmetic_easy_subcats = MathDataset.subcategories()['train-easy']['arithmetic']
        datasets = [
            MathDataset('train-easy', 'arithmetic', s)
            for s in arithmetic_easy_subcats
        ]

        # put together all subcategories and create training and testing splits
        # (we don't use the supplied testing data because we would need to
        # train on the easy, medium and hard arithmetic difficulties to have
        # any chance of doing well on that data)
        self.arithmetic_easy = torch.utils.data.ConcatDataset(datasets)
        self.train_dataset, self.test_dataset = torch.utils.data.random_split(
            self.arithmetic_easy, [.9, .1]
        )
        self.train_dl = torch.utils.data.DataLoader(
            self.train_dataset, batch_size=512, shuffle=True
        )
        self.test_dl = torch.utils.data.DataLoader(
            self.test_dataset, batch_size=1,
        )

        # Create optimizer
        self.optim = torch.optim.Adam(
            self.model.parameters(),
            lr=1e-5,
            betas=(.9, .995),
            eps=1e-9
        )

        # Create loss function
        cel = torch.nn.CrossEntropyLoss(
            ignore_index=self.model.token_embedding.pad_index,
            label_smoothing=.05  # Use label smoothing following Vaswani et al.
        )

        self.loss_fn = make_loss_fn(
            cel,
            self.model.token_embedding.pad_index
        )

        # Create trainer
        self.trainer = QATransformerTrainer(
            db_path,
            self.model,
            self.train_dl,
            self.optim,
            self.loss_fn,
            100
        )

        # save every 900s = 15min
        self.save_callback = SavePeriodicallyCallback(
            self.trainer, 900
        )

    def run(self, verbosity=1):
        """
        Run the experiment.

        :param verbosity: The training update message verbosity
        """
        # defer import to speed up CLI script
        import numpy as np

        import os

        # run training
        losses, accuracies = self.trainer.train(
            epochs=300,
            batch_callbacks=[self.save_callback],
            verbosity=verbosity
        )

        # save last model weights
        self.trainer.save()

        # save loss and training accuracy trajectories
        np.save(
            os.path.join(self.trainer.folder, 'losses.npy'),
            np.array(losses)
        )
        np.save(
            os.path.join(self.trainer.folder, 'accuracies.npy'),
            np.array(accuracies)
        )
