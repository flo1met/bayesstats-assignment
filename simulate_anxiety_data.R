set.seed(123)

## sample size
N <- 120

## 1. Treatment assignment: 0 = control, 1 = mindfulness
group <- rbinom(N, size = 1, prob = 0.5)

## 2. Baseline state anxiety
# Assume a slightly elevated anxious sample: mean ~55, sd ~10
anx_baseline <- rnorm(N, mean = 55, sd = 10)

anx_baseline <- floor(anx_baseline)

## 3. True regression parameters for post-anxiety
beta_0 <- 10      # intercept
beta_1 <- 0.7     # effect of baseline anxiety on post anxiety
beta_2 <- -4      # treatment effect: mindfulness lowers anxiety by ~4 points
sigma  <- 12       # residual SD

## 4. Generate post-exam anxiety
# Linear predictor
mu_post <- beta_0 + beta_1 * anx_baseline + beta_2 * group

# Add noise
anx_post <- rnorm(N, mean = mu_post, sd = sigma)
anx_post <- floor(anx_post)

## 5. bound scores to a plausible 20-80 range
anx_baseline <- pmin(pmax(anx_baseline, 20), 80)
anx_post     <- pmin(pmax(anx_post,     20), 80)

## 6. Put into a data frame
anxiety_data <- data.frame(
  id           = 1:N,
  group        = group,          # 0 = control, 1 = mindfulness
  anx_baseline = anx_baseline,   # baseline state anxiety
  anx_post     = anx_post        # post-exam state anxiety
)

## Quick sanity checks
summary(anxiety_data)
table(anxiety_data$group)
cor(anxiety_data$anx_baseline, anxiety_data$anx_post)

## Check the "ground truth" via lm()
lm(anx_post ~ anx_baseline + group, data = anxiety_data) |> summary()
