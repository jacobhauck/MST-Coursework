from math import log
fprime = 1/3
for n in range(1, 21):
    h = 10 ** (-n)
    fprime_approx = (log(3-2*h) - 8 * log(3-h) + 8*log(3+h) - log(3+2*h))/(12*h)
    print(f'h = 10^{-n}, error = {abs(fprime - fprime_approx)}')