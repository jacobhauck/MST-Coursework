"""
Code for generating stairstep diagrams
"""
import matplotlib.pyplot as plt
import numpy as np


def stairstep(f, start, x_lim, y_lim):
    fig, ax = plt.subplots()
    x = np.linspace(*x_lim, 500)

    ax.plot(x, f(x), label='y = f(x)')
    ax.plot(x, x, label='y = x')
    ax.set_xlabel('x')
    ax.set_ylabel('y')

    hw = .02 * min(x_lim[1] - x_lim[0], y_lim[1] - y_lim[0])
    hl = 1.5 * hw
    for x0 in start:
        pts = [(x0, 0)]
        for step in range(20):
            f_x0 = f(x0)
            if abs(f_x0) > 1e12:
                break
            pts.append((x0, f_x0))
            pts.append((f_x0, f_x0))
            x0 = f_x0
        pts = np.array(pts)
        midpoints = (pts[1:] + pts[:-1]) / 2
        deltas = pts[1:] - pts[:-1]

        p = ax.plot(pts[:, 0], pts[:, 1])
        for mp, delta in zip(midpoints, deltas):
            d = min(np.max(np.abs(delta)) * .3, hl)
            delta = np.sign(delta) * d
            ax.arrow(mp[0] - delta[0]/2, mp[1] - delta[1]/2, delta[0], delta[1],
                     head_width=d/1.5,
                     width=0,
                     color=p[0].get_color(),
                     length_includes_head=True)

    ax.set_xlim(*x_lim)
    ax.set_ylim(*y_lim)
    ax.set_aspect('equal')
    ax.hlines([0], *x_lim)
    ax.vlines([0], *y_lim)

    ax.legend()

    return fig, ax


if __name__ == '__main__':
    # ============ 3.4 (a) ============
    '''
    # Case: 1 < lambda < 3
    stairstep(lambda x: 2.2*x*(1 - x), [-.25, .06, .8], (-1.5, 1.5), (-1, 1))
    plt.savefig('3.4a lambda lt 3.png')
    plt.show()

    # Case: lambda = 3
    stairstep(lambda x: 3*x*(1 - x), [-.25, .06, .8], (-1.5, 1.5), (-1, 1))
    plt.savefig('3.4a lambda eq 3.png')
    plt.show()

    # Case: lambda > 3
    stairstep(
        lambda x: 3.8 * x * (1 - x), [-.05, 1 - 1 / 3.8 + .01],
        (-1.5, 1.5), (-1, 1)
    )
    plt.savefig('3.4a lambda gt 3.png')
    plt.show()

    # ============ 3.4 (c) ============

    # Case: lambda < -1/4
    stairstep(lambda x: -1 - x ** 2, [.25, -.5, 0], (-1.5, 1.5), (-3.5, .25))
    plt.savefig('3.4c lambda lt -14.png')
    plt.show()

    # Case: lambda = -1/4
    stairstep(lambda x: -1 / 4 - x ** 2, [-.15, -.75, ], (-1.5, 1.5), (-3.5, .25))
    plt.savefig('3.4c lambda eq -14.png')
    plt.show()
    
    # Case: -1/4 < lambda < 3/4
    stairstep(lambda x: 1/4 - x**2, [-.4, .15, .6, -1.5], (-2.5, 2.5), (-4, 1))
    plt.savefig('3.4c lambda gt -14.png')
    plt.show()

    # Case: lambda = 3/4
    stairstep(lambda x: 3/4 - x**2, [-1, .15, .6, -1.7], (-2.5, 2.5), (-4, 1))
    plt.savefig('3.4c lambda eq 34.png')
    plt.show()
    
    # Case: lambda > 3/4
    stairstep(lambda x: 1.1 - x**2, [-1, .15, .6, -1.7], (-2.5, 2.5), (-4, 1))
    plt.savefig('3.4c lambda gt 34.png')
    plt.show()

    # ============ 3.4 (d) ============

    # Case: |lambda| < sqrt(3) / 2
    stairstep(
        lambda x: (1/2)**2 - x ** 2, [-.4, .15, .6, -1.5],
        (-2.5, 2.5), (-4, 1)
    )
    plt.savefig('3.4d lambda lt sqrt(3)2.png')
    plt.show()

    # Case: |lambda| = sqrt(3) / 2
    stairstep(lambda x: 3/4 - x ** 2, [-1, .15, .6, -1.7], (-2.5, 2.5), (-4, 1))
    plt.savefig('3.4d lambda eq sqrt(3)2.png')
    plt.show()

    # Case: |lambda| > sqrt(3) / 2
    stairstep(lambda x: 1.1 - x ** 2, [-1, .15, .6, -1.7], (-2.5, 2.5), (-4, 1))
    plt.savefig('3.4d lambda gt sqrt(3)2.png')
    plt.show()
    '''
    # ============ 3.6 ============

    # Case: b < -2
    stairstep(
        lambda x: -2.5*x*(1.5/2.5 - x), [-.25, .05, .9, 1.2],
        (-1, 1.5), (-.5, 2)
    )
    plt.savefig('3.6 b lt -2.png')
    plt.show()

    # Case: b = -2
    stairstep(lambda x: -2*x*(1/2 - x), [-.25, .6, 1.1], (-1, 1.5), (-.5, 2))
    plt.savefig('3.6 b eq -2.png')
    plt.show()

    # Case: -2 < b < 0
    stairstep(lambda x: -1*x*(0 - x), [-.25, .6, 1.2], (-1, 1.5), (-.5, 2))
    plt.savefig('3.6 b gt -2.png')
    plt.show()

    # Case 0 < b < 2
    stairstep(lambda x: 1*x*(2 - x), [-.25, .6, 1.2], (-1, 1.5), (-.5, 2))
    plt.savefig('3.6 b gt 0.png')
    plt.show()

    # Case b = 2
    stairstep(lambda x: 2*x*(3/2 - x), [-.25, .6, 1.2], (-1, 1.5), (-.5, 2))
    plt.savefig('3.6 b eq 2.png')
    plt.show()

    # Case b > 2
    stairstep(lambda x: 3*x*(4/3 - x), [-.25, .6, 1.2], (-1, 1.5), (-.5, 2))
    plt.savefig('3.6 b gt 2.png')
    plt.show()
