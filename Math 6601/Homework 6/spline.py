import numpy as np


class Spline:
   def __init__(self, points, coeffs):
     self.points = points  # (n+1)
     self.coeffs = coeffs  # (n, 4)

   def __call__(self, x):
     # :param x: any shape array of points
     x = np.array(x, dtype=float)
     shape = x.shape
     x = x.reshape(-1, 1)  # (B, 1)
     d = x - self.points[None, :-1]  # (B, n)
     dshift = x - self.points[None, 1:]  # (B, n)
     print(d)
     print(dshift)
     print(dshift < 0)
     print(d >= 0)
     print(np.bitwise_or(dshift < 0, x == self.points[None, -1:]))
     contained = np.bitwise_and(d >= 0, np.bitwise_or(dshift < 0, np.concatenate([np.zeros((d.shape[0], d.shape[1] - 1), dtype=bool), x == self.points[None, -1:]], axis=1)))
     print(contained)
     vals = self.coeffs[None, :, 0] + self.coeffs[None, :, 1] * d + self.coeffs[None, :, 2] * d**2 + self.coeffs[None, :, 3] * d**3
     print(vals)
     return np.sum(vals*contained, axis=1)

   def diff(self):
     coeffs = self.coeffs.copy()
     coeffs[:, 0] = coeffs[:, 1]
     coeffs[:, 1] = 2*coeffs[:, 2]
     coeffs[:, 2] = 3*coeffs[:, 3]
     coeffs[:, 3] = 0
     return Spline(self.points, coeffs)
