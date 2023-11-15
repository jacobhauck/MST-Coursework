import random
from string import ascii_lowercase
import torch


class SimpleDataset1(torch.utils.data.Dataset):
    def __init__(self, size):
        self.questions = []
        self.answers = []
        for _ in range(size):
            period = random.randint(1, 6)
            reps = random.randint(1, 20)
            self.questions.append(ascii_lowercase[:period] * reps)
            self.answers.append(''.join(reversed(ascii_lowercase[:period])) * ((reps + 1) // 2))

    @staticmethod
    def tokens():
        return tuple(ascii_lowercase[:6])

    def __len__(self):
        return len(self.questions)
    
    def __getitem__(self, index):
        return self.questions[index], self.answers[index]
