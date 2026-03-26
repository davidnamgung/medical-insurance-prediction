# 1. Test basic computation and console output
print("Environment test: If you see this, R is executing code correctly!")

# 2. Load a built-in dataset (Motor Trend Car Road Tests)
data(mtcars)

# 3. View the first few rows (Tests the data viewer capabilities)
head(mtcars)

# 4. Create a basic plot (Tests the httpgd plot viewer)
# This should automatically pop open a new plot pane in VS Code
plot(
  x = mtcars$wt,
  y = mtcars$mpg,
  main = "Car Weight vs. Mileage",
  xlab = "Weight (1000 lbs)",
  ylab = "Miles Per Gallon",
  pch = 19,         # Solid circles
  col = "steelblue" # Color
)

# 5. Add a trend line to the plot
abline(lm(mpg ~ wt, data = mtcars), col = "red", lwd = 2)