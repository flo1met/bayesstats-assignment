data {
  int<lower=0> n;
  vector[n] y;       // anx_post
  vector[n] x1;      // anx_baseline
  vector[n] x2;      // group (0/1)
}

parameters {
  real beta_0;
  real beta_1;
  real beta_2;
  real<lower=0> sigma;   // Stan uses SD, not variance
}

model {
  // Priors — fill in the same values you chose for your Gibbs sampler
  beta_0 ~ normal(___, ___);
  beta_1 ~ normal(___, ___);
  beta_2 ~ normal(___, ___);
  sigma  ~ inv_gamma(___, ___);   // shape = a0, scale = b0

  // Likelihood
  y ~ normal(beta_0 + beta_1 * x1 + beta_2 * x2, sigma);
}
