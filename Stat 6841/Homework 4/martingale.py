import numpy as np
import matplotlib.pyplot as plt


def random_bernoulli():
    return float(np.random.random() < 0.5)


def random_normal():
    return np.random.normal()
    

def simulate(n, random_fn):
    s = np.empty(n)
    s[0] = random_fn()
    for i in range(1, n):
        s[i] = s[i-1] + random_fn()
    return s


def plot3_bernoulli():
    paths = [simulate(50, random_bernoulli) for _ in range(3)]
    n = np.arange(50)
    for path in paths:
        plt.plot(n, path)
    plt.show()
    
    
def plot3_normal():
    paths = [simulate(50, random_normal) for _ in range(3)]
    n = np.arange(50)
    for path in paths:
        plt.plot(n, path)
    plt.show()


if __name__ == '__main__':
    plot3_bernoulli()
    plot3_normal()
