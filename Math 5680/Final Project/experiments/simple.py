"""
The experiment on the simple dataset.
"""

import os

import numpy as np
import torch.utils.data

from simple_dataset import SimpleDataset
from training import QATransformerTrainer, SavePeriodicallyCallback, \
    make_loss_fn
from transformer import Transformer, TokenEmbedding


class SimpleDatasetExperiment:
    """
    Runs the experiment with the simple dataset.
    """

    def __init__(self, db_path):
        """
        :param db_path: Path relative to models folder in which to save data
        related to the experiment.
        """
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

    def run_training(self, verbosity=1):
        """
        Run the training portion of the experiment.

        :param verbosity: The training update message verbosity
        """
        # run training
        losses, accuracies = self.trainer.train(
            epochs=4,
            batch_callbacks=[self.save_callback],
            verbosity=verbosity
        )

        # save last model weights
        self.trainer.save()

        # add latest data to previous saved training data
        p_loss = os.path.join(self.trainer.folder, 'losses.npy')
        p_acc = os.path.join(self.trainer.folder, 'accuracies.npy')

        old_losses = np.load(p_loss) if os.path.exists(p_loss) else np.empty((0,))
        old_acc = np.load(p_acc) if os.path.exists(p_acc) else np.empty((0,))

        # save loss and training accuracy trajectories
        np.save(p_loss, np.concatenate([old_losses, np.array(losses)]))
        np.save(p_acc, np.concatenate([old_acc, np.array(accuracies)]))

    def run_evaluation(self, weights):
        """
        Run the evaluation portion of the experiment.

        :param weights: The saved model weight checkpoint to load for evaluation.
        """
        # Load checkpoint for evaluation
        self.trainer.load(weights)

        n_total = 0
        n_correct = 0
        n_first_correct = 0

        def evaluate(model_answer, actual_answer):
            nonlocal n_total, n_correct, n_first_correct

            n_total += 1

            if model_answer == actual_answer:
                n_correct += 1

            first = min(len(model_answer), len(actual_answer))
            if model_answer[:first] == actual_answer[:first]:
                n_first_correct += 1

        self.trainer.evaluate(self.test_dl, evaluate)

        print(f'Test accuracy: {n_correct / n_total * 100:.02f}')
        print(f'Test accuracy (first): {n_first_correct / n_total * 100:.02f}')
