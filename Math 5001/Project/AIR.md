Adversarial Image Reconstruction.

# Description
Let $\mathcal{T}: \mathbb{R}^{(p,2)}\to\mathbb{R}^2$ be a parametric family of transformations depending on a parameter in $\mathbb{R}^p$, and let $\mathcal{S}$ be the corresponding [[Spatial Transformers#Discrete Case|discrete spatial transformer]]. Let $\mathscr{G}: \mathbb{R}^{(2, C, W, H)} \to \mathbb{R}^p$ be a **generator** function, and let $\mathscr{C}: \mathbb{R}^{(2, C, W, H)}\to \mathbb{R}$ be a WGAN critic.

Define an **image batch** $I$ as an $s$[[Multi-indexing#Shaped arrays|-shaped array]] of images, so that $s[-4:] = (C, W, H)$, where $W$ is the width of the images, $H$ is the height of the images, and $C$ is the number of channels in each image. Furthermore, define a **transformation batch** $\theta$ as a $(s[-3:], p)$-shaped array of transformation parameters for $\mathcal{T}$.

Given an image batch $I_g$ and a transformation batch $\theta_g$, let $M_g = \mathcal{S}(\theta_g, I_g)$, let $\widehat{\theta}_g =  \mathscr{G}(I_g, M_g)$, and let $\widehat{M}_g =\mathcal{S}\left(\widehat{\theta}_g, I_g\right)$. Suppose we have another image batch $I_c$ and another transformation batch $\theta_g$. Let $M_c = \mathcal{S}(\theta_c, I_c)$. Then we can compute the **critic loss**
$$
\mathcal{L}_\text{critic}(I_g,\theta_g, I_c, \theta_c) = \text{mean}\left(\mathscr{C}\left(I_g, \widehat{M}_g\right)\right) - \text{mean}(\mathscr{C}(I_c, M_c)\Big)
$$
We can also compute the **generator WGAN loss**
$$
\mathcal{L}_{\text{generator-WGAN}}(I_g,\theta_g) = -\text{mean}\left(\mathscr{C}\left(I_g, \widehat{M}_g\right)\right)
$$
Finally, we can compute the **generator direct loss**
$$
\mathcal{L}_{\text{generator-direct}}(I_g, \theta_g) = \text{mean}\left(\left\lVert\theta_g - \widehat{\theta}_g \right\rVert_2^2\right)
$$
from which we obtain the **total generator loss**
$$
\mathcal{L}_{\text{generator}}(I_g, \theta_g) = \mathcal{L}_{\text{generator-WGAN}}(I_g, \theta_g) + \alpha\mathcal{L}_{\text{generator-direct}}(I_g, \theta_g)
$$
where $\alpha > 0$ is a training hyperparameter. 
