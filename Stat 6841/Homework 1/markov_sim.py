import numpy as np

# Define state space, and construct index
s = [1, 2, 3, 4]
s_index = {s_i: i for i, s_i in enumerate(s)}

# Define transition matrix
p = np.array([
    [0.2, 0.3, 0, 0.5],
    [0.1, 0.6, 0.1, 0.2],
    [0.45, 0.55, 0, 0],
    [0, 0, 0.9, 0.1]
])

# Define initial distribution
pi_0 = np.array([0.2, 0.25, 0.25, 0.3])

# Set end time
end_time = 5


# Define simulation increment function
def step(x):
    """Simulate next value X_{n+1} given current X_n"""
    return np.random.choice(s, p=p[s_index[x]])


# Simulate Markov chain
x_n = np.random.choice(s, p=pi_0)
for n in range(end_time + 1):
    print(f'X_{n} = {x_n}')
    x_n = step(x_n)
