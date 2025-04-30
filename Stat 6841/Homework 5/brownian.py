import numpy as np

def simulate(n):
    # Allocate empty array to store the path
    b = np.empty(n+1)
    
    # Generate evenly-spaced time points
    t = np.linspace(0, 1, n+1)
    
    # Initialize path to 0
    b[0] = 0
    
    # Generate path by adding N(0,1/sqrt(n)) random value
    # to the previous value
    for i in range(n):
        b[i+1] = b[i] + np.random.normal()/n**.5
    
    return t, b


if __name__ == '__main__':
    import matplotlib.pyplot as plt
    
    t50, b50 = simulate(50)
    t100, b100 = simulate(100)
    t1000, b1000 = simulate(1000)
    
    plt.plot(t50, b50, label='N=50')
    plt.plot(t100, b100, label='N=100')
    plt.plot(t1000, b1000, label='N=1000')
    plt.legend()
    plt.show()
