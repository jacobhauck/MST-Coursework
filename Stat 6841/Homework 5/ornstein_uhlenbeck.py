import numpy as np


def simulate(n):
    # Get t values
    t = np.linspace(0, 1, n+1)
    
    # Initialize process x and B(e^{2*0)) = B(1) ~ N(0,1)
    x = np.empty(n+1)
    b = np.random.normal()
    x[0] = b
    
    for i in range(n):
        # Compute B(e^{2t_{i+1}})
        b += np.random.normal() * (np.exp(2*t[i+1]) - np.exp(2*t[i]))
        x[i+1] = b * np.exp(-t[i+1])
    
    return t, x
    
    
if __name__ == '__main__':
    import matplotlib.pyplot as plt
    
    t50, x50 = simulate(50)
    t100, x100 = simulate(100)
    t1000, x1000 = simulate(1000)
    
    plt.plot(t50, x50, label='N=50')
    plt.plot(t100, x100, label='N=100')
    plt.plot(t1000, x1000, label='N=1000')
    plt.legend()
    plt.show()
