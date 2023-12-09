"""
Classes and functions for managing training logic and model I/O.
"""

from typing import Callable, List
import tqdm.notebook
import os
import time
import torch


def make_loss_fn(
        cel: torch.nn.CrossEntropyLoss,
        pad_index: int,
        neg_inf: float = -1000.
):
    """
    Converts a base cross loss function into one that
    ignores padding tokens in the target output

    :param cel: A torch.nn.CrossEntropyLoss instance
    :param pad_index: <pad> token index
    :param neg_inf: negative infinity value to mask out padding tokens with
    """
    def loss_fn(prob, actual):
        pad_b, pad_n = torch.nonzero(actual == pad_index, as_tuple=True)
        prob[pad_b, :, pad_n] = neg_inf
        return cel(prob, actual)

    return loss_fn


def average(arr, average_window):
    """
    Compute average of last average_window elements of arr.

    :param arr: an array
    :param average_window: size of averaging window
    :return: average over last average_window elements of arr, or average
        of arr, if len(arr) < average_window, or 0 if len(arr) == 0
    """
    return sum(arr[-average_window:]) / max(1, min(len(arr), average_window))


class QATransformerTrainer:
    """
    QATransformerTrainer objects are used to manage the training and evaluation
    of a Transformer and to manage model weight I/O.
    """

    def __init__(
            self, folder, model, data_loader, optim, loss_fn, average_window
    ):
        """
        :param folder: The folder to save model parameters in
        :param model: The model to train
        :param data_loader: An object that provides batches of data
        :param optim: optimizer object to use to train the model
        :param loss_fn: the loss function, which computes loss given prob and
            actual outputs of Transformer.forward
        :param average_window: length of loss/accuracy averaging window
        """
        self.folder = folder
        self.model = model
        self.data_loader = data_loader
        self.optim = optim
        self.loss_fn = loss_fn
        self.average_window = average_window

    def index_path(self, index: int):
        """
        :param index: index to get the path for
        :return: The file path of the given save index
        """
        return os.path.join(self.folder, f'{index}.dat')

    def save(self, index: int | None = None):
        """
        :param index: index to save model to. If None, then a new index will
            be created. Otherwise, the given index must exist in the save folder
        """
        if index is not None:
            path = self.index_path(index)
            assert os.path.exists(path)
        else:
            files = [f for f in os.listdir(self.folder) if f.endswith('.dat')]
            last_index = max(map(lambda f: int(os.path.splitext(f)[0]), files),
                             default=-1)
            path = self.index_path(last_index + 1)

        torch.save(self.model.state_dict(), path)

    def load(self, index: int):
        """
        Loads the model saved at the given index. Saves the current model
        before overwriting it.

        :param index: save index to load
        """
        path = self.index_path(index)
        assert os.path.exists(path)

        self.save()
        self.model.load_state_dict(torch.load(path))

    def train(
            self,
            epochs: int | None = None,
            batches: int | None = None,
            batch_callbacks: List[Callable[[int, int], None]] = (),
            verbosity: int = 2
    ):
        """
        Runs the specified amount of training on the attached model.
        If both epochs and batches are None, then the function will
        train for 1 epoch by default. If both are supplied, then batches is
        ignored.

        :param epochs: how many epochs to train for
        :param batches: how many batches to train for (if epochs is None)
        :param batch_callbacks: a list of function to call after each batch.
            Each function should have signature
            (i_epoch: int, i_batch: int) -> None, where i_epoch and
            i_batch are the epoch and batch indices of the current epoch and
            batch
        :param verbosity: How verbose the progress message should be.
            0 = no progress messages, 1 = progress bars, 2 = one message per
            batch.
        """

        # default to 1 epoch if no arguments are given
        if epochs is None and batches is None:
            epochs = 1

        # ignore batches argument in favor epochs
        if epochs is not None:
            batches = None

        # input validation (avoid an almost infinite loop)
        if epochs is not None:
            assert epochs > 0

        if batches is not None:
            assert batches > 0

        # training
        # create progress updater
        updater = None

        if verbosity == 0:
            updater = None
        elif verbosity == 1:
            num_batches = len(self.data_loader) if batches is None else batches
            updater = ProgressBarUpdater(
                    epochs, num_batches, self.average_window
            )
        elif verbosity == 2:
            num_batches = len(self.data_loader) if batches is None else batches
            updater = BatchProgressUpdater(
                    epochs, num_batches, self.average_window
            )

        # store losses and accuracies and return them
        batch_losses, batch_accuracies = [], []

        # put model in training mode
        self.model.train()

        # iterate over desired number of epochs or forever if using batches
        for i_epoch in range(999999999999999 if epochs is None else epochs):
            # self.data_loader is an iterable of all batches in an epoch
            for i_batch, (b_question, b_answer) in enumerate(self.data_loader):
                # exit if we have done enough batches
                if batches is not None and len(batch_losses) == batches:
                    return batch_losses, batch_accuracies

                # get next-token probabilities and actual indices
                prob, actual = self.model(b_question, b_answer)

                # compute loss + gradients, and perform optimization step
                loss = self.loss_fn(prob, actual)

                self.optim.zero_grad()
                loss.backward()
                self.optim.step()

                # save batch loss and accuracy
                batch_losses.append(loss.item())
                # noinspection PyUnresolvedReferences
                not_pads = (actual != self.model.token_embedding.pad_index).float()
                n_tokens = not_pads.sum(dim=1)
                # noinspection PyUnresolvedReferences
                matched = (prob.argmax(dim=1) == actual).float() * not_pads
                acc = (matched.sum(dim=1) / n_tokens).mean()
                batch_accuracies.append(acc)

                # print progress messages and run callbacks
                if updater is not None:
                    updater(i_epoch, i_batch, batch_losses, batch_accuracies)

                for batch_callback in batch_callbacks:
                    batch_callback(i_epoch, i_batch)

        return batch_losses, batch_accuracies

    def evaluate(self, test_dl, verbosity: int = 1):
        """
        :param test_dl: data loader for the test dataset
        :param verbosity: 0 for no messages, 1 for progress bars
        """

        # put model in evaluation mode (turn off dropout)
        self.model.eval()

        # counters
        n_correct = 0
        n_total = 0

        # turn off gradient computations to speed up inference
        with torch.no_grad():
            if verbosity == 1:
                test_dl = tqdm.notebook.tqdm(test_dl, unit='batches', position=0)

            for batch in test_dl:
                qas = zip(*batch)
                if verbosity == 1:
                    qas = tqdm.notebook.tqdm(qas, unit='questions', position=1)

                for question, answer in qas:
                    model_answer = self.model(question)

                    if model_answer.lower() == answer.lower():
                        n_correct += 1

                    n_total += 1

        return n_correct / n_total


class ProgressBarUpdater:
    """
    An updater that uses a progress bar to report progress, with per-batch
    updates to the running loss and accuracy.
    """

    def __init__(
            self, num_epochs: int | None, num_batches: int, average_window: int
    ):
        """
        :param num_epochs: total number of training epochs. None indicates that
            batch mode is being used.
        :param num_batches: total number of training batches
        """
        tqdm_position = 0
        if num_epochs is not None:
            self.epoch_tqdm = tqdm.notebook.tqdm(
                total=num_epochs, unit='epochs', position=tqdm_position
            )
            tqdm_position += 1
        else:
            self.epoch_tqdm = None

        self.batch_tqdm = tqdm.notebook.tqdm(
            total=num_batches, unit='batches', position=tqdm_position
        )

        self.average_window = average_window

    def __call__(
            self, i_epoch: int, i_batch: int,
            losses: List[float], accuracies: List[float]
    ):
        """
        Called during training once per batch
        :param i_epoch: current epoch index
        :param i_batch: current batch index
        :param losses: list of batch losses
        :param accuracies: list of batch accuracies
        """
        if self.epoch_tqdm is not None:
            # update using epoch mode
            if i_batch == 0 and i_epoch > 0:
                self.batch_tqdm.reset()
                self.epoch_tqdm.update(1)
            else:
                self.batch_tqdm.update(1)
        else:
            # update using batch mode
            self.batch_tqdm.update(1)

        self.batch_tqdm.set_postfix_str(
            f'Current loss: {average(losses, self.average_window):.05f}, '
            + 'Current accuracy: '
            + f'{average(accuracies, self.average_window) * 100:.2f}%'
        )


class BatchProgressUpdater:
    """
    An updater object that prints one progress message per batch
    """

    def __init__(
            self, num_epochs: int | None, num_batches: int, average_window: int
    ):
        """
        :param num_epochs: total number of training epochs. None indicates that
            batch mode is being used.
        :param num_batches: total number of training batches
        """
        self.num_epochs = num_epochs
        self.num_batches = num_batches
        self.average_window = average_window

    def __call__(
            self, i_epoch: int, i_batch: int,
            losses: List[float], accuracies: List[float]
    ):
        """
        Called during training once per batch

        :param i_epoch: current epoch index
        :param i_batch: current batch index
        :param losses: list of batch losses
        :param accuracies: list of batch accuracies
        """
        if self.num_epochs is not None:
            epoch_str = f'Epoch {i_epoch + 1} / {self.num_epochs}. '
        else:
            epoch_str = ''

        print(
            epoch_str
            + f'Batch {i_batch + 1} / {self.num_batches}. '
            + f'Loss: {average(losses, self.average_window):.05f}. '
            + f'Accuracy: {average(accuracies, self.average_window) * 100:.2f}%'
        )


class SavePeriodicallyCallback:
    """
    Type of callback to be passed to QATransformerTrainer.train's
    batch_callbacks option. This callback will save the model being
    every time a specified amount of time since the last save elapses.
    """

    def __init__(self, trainer: QATransformerTrainer, save_interval: float):
        """
        :param trainer: QATransformerTrainer trainer object training the model
        :param save_interval: Time in seconds between model saves.
        """
        self.trainer = trainer
        self.save_interval = save_interval
        self.last_save_time = time.time()

    def __call__(self, i_epoch, i_batch):
        """
        Saves the model if self.save_interval seconds have elapsed since
        the last save

        :param i_epoch: current epoch index
        :param i_batch: current batch index
        """
        if time.time() - self.last_save_time >= self.save_interval:
            self.trainer.save()
            self.last_save_time = time.time()


class WarmupLRScheduleCallback:
    """
    Callback to be passed to the callbacks option of
    QATransformerTrainer.train. This callback sets the learning rate of the
    optimizer according the schedule in Vaswani et al. (section 5.3)
    """

    def __init__(self, warmup_steps: int, d: int, optim, base_lr: float = 1.0):
        """
        :param warmup_steps: number of warmup steps
        :param d: embedding dimension of model
        :param optim: PyTorch optimizer object being used to optimize
            the model
        :param base_lr: Base learning rate to multiply by
        """
        self.warmup_steps = warmup_steps
        self.d = d
        self.optim = optim
        self.base_lr = base_lr
        self.step = 0

    def __call__(self, i_epoch: int, i_batch: int):
        """
        Advances the step counter and updates the learning rate of the
        optimizer according to schedule in Vaswani et al.

        :param i_epoch: current epoch index
        :param i_batch: current batch index
        """
        self.step += 1
        self.optim.lr = self.base_lr * self.d**(-.5) * min(
                self.step**(-.5), self.step * self.warmup_steps**(-1.5)
        )
