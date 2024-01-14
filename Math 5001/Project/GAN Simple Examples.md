# Failure Example
Let $U$ be uniformly distributed on $[0,1]^2$, and let $V = (X, 0)$, where $X$ is uniformly distributed on $[0,1]$. The Kullback-Leibler divergence of $U$ and $V$ is undefined because $V$ is confined to a $1$-dimensional manifold.

Try setting up a GAN to map $U$ to $V$ anyway: let $g_\theta$ be a neural network with parameters $\theta$ and $d_\varphi$ a neural network with parameters $\varphi$. Then define the usual discriminator loss
$$
\mathcal{L}_d(U, V) = -\mathbb{E}[\log(1-d_\varphi(g_\theta(U)))] - \mathbb{E}[\log(d_\phi(V))]
$$
and the generator loss
$$
\mathcal{L}_g(U) = -\mathbb{E}[\log(d_\phi(g_\theta(U)))]
$$
where we have used the $\log(D)$ trick in defining $\mathcal{L}_g$.

# Success Example
Let $U$ be uniformly distributed on $[0, 1/2]\times[0,1]$, and let $V$ be uniformly distributed on $[1/2, 1] \times [0, 1]$. 