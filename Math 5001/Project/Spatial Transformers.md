# Continuous Case
Let $\mathcal{T}: \mathbb{R}^{(p, n)} \to \mathbb{R}^n$ be a transformation depending on a parameter $\theta \in \mathbb{R}^p$.  For a kernel function $K \in L_1(\mathbb{R}^n)$, define the **spatial transformer** $\mathcal{S}_\theta: L_1(\mathbb{R}^n)\to L_1(\mathbb{R}^n)$ by
$$
\mathcal{S}_\theta f(x) = \int f(y)K(\mathcal{T}(\theta,x) - y)\;\text{d}y
$$
# Discrete Case
Again assume that we have a differentiable transformation $\mathcal{T}: \mathbb{R}^{(p, n)} \to \mathbb{R}^n$ depending on the parameter $\theta \in \mathbb{R}^p$, with [[Jacobian]] $J$ with respect to $\theta$ and a kernel function $K \in L_1(\mathbb{R}^n)$. Then the **discrete spatial transformer** $\mathcal{S}$ with sampling [[Multi-indexing|shape]] $g$ maps a parameter $\theta$ and an $s$[[Multi-indexing#Shaped arrays|-shaped array]] to $g$-shaped array as follows
$$
\mathcal{S}(\theta, u)[i] = \sum_{j \in \mathcal{I}(s)} u_j K(\mathcal{T}(\theta, x_i) -y_j)
$$
where $x$ is a fixed $g$-shaped array of **grid sample points**, and $y$ is a fixed $s$-shaped array of **function sample points** associated with the transformer.

$\mathcal{S}$ is effectively a transformation taking the components of $u$ and the components of $\theta$ to the components of $v=\mathcal{S}(\theta, u)$. Therefore, we can find the Jacobian of $\mathcal{S}$ by computing the partial derivatives of the coponents of $v$ with respect to the components of $u$ and the components of $\theta$:
$$
\frac{\partial v_i}{\partial u_j} = K(\mathcal{T}(\theta,x_i) - y_j)
$$
$$
\frac{\partial v_i}{\partial \theta_k} = \sum_{j\in\mathcal{I}(s)}u_j\nabla K(\mathcal{T}(\theta, x_i) - y_j) J(\theta, x_i)[:,k]
$$
## Affine $\mathcal{T}$
If $\mathcal{T}$ is affine, then it can be written in the form 
$$
\mathcal{T}(\theta, x) = A(\theta)x + b(\theta)
$$
for $\theta \in \mathbb{R}^{(n,n)}\times\mathbb{R}^n$. If we write $\theta = (\theta_A, \theta_b)$, then define $A(\theta) = \theta_A$ and $b(\theta) = \theta_b$. The Jacobian of $\mathcal{T}$ with respect to $\theta$ is given for $y = \mathcal{T}(\theta, x)$ by
$$
\frac{\partial y_i}{\partial \theta_b[j]} = \delta_{ij}
$$
$$
\frac{\partial y_i}{\partial \theta_A[k]} = \delta_{ik[1]}x_{k[2]}
$$
