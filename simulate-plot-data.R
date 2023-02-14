# Simulate and plot data
# Torbet McNeil
# tmcneil@arizona.edu
# 2023-02-13

# Simulate predictor variable
x <- rnorm(n = 100)
# Simulate response variable with some noise
y <- 2 * x + rnorm(n = 100, sd = 0.2)

# Plot the data
plot(x = x, y = y)