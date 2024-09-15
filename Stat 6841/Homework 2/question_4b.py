"""Simulate a Poisson process up to a given time"""
import numpy as np

rate = 2
stop_time = 9

n = 0
s = 0
while s < stop_time:
    # Simulate delay until next event. Note that NumPy uses the mean of the
    # exponential distribution as the parameter, not the rate.
    t = np.random.exponential(1/rate)
    s += t
    n += 1

# Note that the last event occurred after stop_time, so print n-1
print(f'N({stop_time}) = {n-1}')
