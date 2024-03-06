"""
Step-by-step Euler's method for x' = -f(x) / f'(x), f(x) = x^2 - 2
"""
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--start', type=float)
parser.add_argument('--step', type=float)

args = parser.parse_args()

n = 0
x_n = args.start
h = args.step

while True:
    print(f'x_{n} = {x_n}')
    
    if input() == 'q':
        break
    
    x_n = x_n - h * (x_n**2 - 2) / (2*x_n)
    n += 1
