"""
Random utility functions
"""

import matplotlib.pyplot as plt


def token_set(dataset, must_include=()):
    """
    Finds the token set of a dataset.

    :param dataset: A Dataset object to find the tokens in
    :param must_include: A set of tokens that must be included
    :return: The token set of the given Dataset plus the tokens in must_include
    """
    seen_tokens = set(must_include)
    for question, answer in dataset:
        # Just use lower-case characters as tokens
        seen_tokens.update(question.lower())
        seen_tokens.update(answer.lower())

    return tuple(sorted(seen_tokens))


def plot_length_histogram(dataset):
    """
    Plots a histogram of the lengths of question and answer sequences in a
    dataset.

    :param dataset: The dataset of questions and answers
    """
    q_lengths, a_lengths = [], []
    for q, a in dataset:
        q_lengths.append(len(q))
        a_lengths.append(len(a))

    plt.hist(q_lengths, density=True)
    plt.show()
    plt.hist(a_lengths, density=True)
    plt.show()
