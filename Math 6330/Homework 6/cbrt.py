import argparse

parser = argparse.ArgumentParser()
parser.add_argument(type=float, dest='number', metavar='X')
parser.add_argument('--guess', required=True, type=float)

args = parser.parse_args()

n = 0
x = args.guess
while True:
    print(f'n = {n}    x_n = {x}')

    if input() == 'q':
        break

    x = (2/3 * x) + args.number/(3 * x**2)
    n += 1
