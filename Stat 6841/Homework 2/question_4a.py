"""Simulate a Poisson process"""
import numpy as np

rate = 2
simulation_length = 20  # Number of events to simulate

n = 0
s = [0]  # N(t) can be recovered from S_n, so we can store the path using S_n
while n < simulation_length:
    # Simulate delay until next event. Note that NumPy uses the mean of the
    # exponential distribution as the parameter, not the rate.
    t = np.random.exponential(1/rate)
    s.append(s[n] + t)
    n += 1

    print(f'Event {n} occurred at time {s[n]}')
