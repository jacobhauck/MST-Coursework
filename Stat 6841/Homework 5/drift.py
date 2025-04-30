import brownian

def simulate(n, mu, sigma):
    # Generate standard motion
    t, b = brownian.simulate(n)
    
    # Transform to motion with drift + standard deviation
    return t, mu * t + sigma * b


if __name__ == '__main__':
    import matplotlib.pyplot as plt
    
    t50, b50 = simulate(50, mu=2, sigma=0.05)
    t100, b100 = simulate(100, mu=2, sigma=0.05)
    t1000, b1000 = simulate(1000, mu=2, sigma=0.05)
    
    plt.plot(t50, b50, label='N=50')
    plt.plot(t100, b100, label='N=100')
    plt.plot(t1000, b1000, label='N=1000')
    plt.legend()
    plt.show()
