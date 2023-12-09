"""
The experiment on the simple dataset.
"""


class SimpleDatasetExperiment:
    """
    Runs the experiment with the simple dataset.
    """

    def __init__(self, db_path):
        """
        :param db_path: Path relative to models folder in which to save data
        related to the experiment.
        """
        # defer imports to speed up CLI script
        import torch.utils.data

        from simple_dataset import SimpleDataset
        from training import QATransformerTrainer, SavePeriodicallyCallback, \
            make_loss_fn
        from transformer import Transformer, TokenEmbedding

        # Create model
        self.model = Transformer(
            TokenEmbedding(SimpleDataset.tokens(), 256),
            130, 6, 6, 8, 1024, p_dropout=0.1
        ).cuda()

        # Create training and testing datasets
        self.train_dataset = SimpleDataset(1000000)
        self.test_dataset = SimpleDataset(10000)

        # Create training and testing data loaders
        self.train_dl = torch.utils.data.DataLoader(
            self.train_dataset, batch_size=256, shuffle=True,
        )
        self.test_dl = torch.utils.data.DataLoader(
            self.test_dataset, batch_size=1
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
            epochs=4,
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
