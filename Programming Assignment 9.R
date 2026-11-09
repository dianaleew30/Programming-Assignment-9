# Diana Lee
# COP2073C Programming Assignment 9
# Linear Regression with mtcars dataset
# 2026-11-08

# 1. Plot the Data
plot(mtcars$wt, mtcars$mpg,
     main = "Fuel Efficiency vs. Vehicle Weight",
     xlab = "Weight (thousands of pounds)",
     ylab = "Miles per Gallon (MPG)",
     pch = 19, col = "blue")

# 2. Fit a Linear Regression Model
model <- lm(mpg ~ wt, data = mtcars)

# 3. Add the Fitted Regression Line
abline(model, col = "red", lwd = 2)

# 4. Interpret the Slope and Statistical Significance
model_summary <- summary(model)
model_confint <- confint(model)

slope_est <- coef(model)["wt"]
p_val <- model_summary$coefficients["wt", "Pr(>|t|)"]
slope_ci <- model_confint["wt", ]

cat("Slope Estimate:", slope_est, "\n")
cat("p-value:", p_val, "\n")
cat("95% Confidence Interval for Slope:", slope_ci[1], slope_ci[2], "\n")
cat("The slope is statistically significant at the 0.05 level, indicating\n",
    "a significant relationship between weight and fuel efficiency.\n\n")

# 5. Predict MPG for a Given Vehicle Weight (6,000 lbs = 6)
new_car <- data.frame(wt = 6)
prediction <- predict(model, newdata = new_car, interval = "prediction", level = 0.95)

# 6. Print the Prediction
cat("Predicted MPG for a 6,000-pound vehicle:\n")
print(prediction)
cat("\n")

# 7. Evaluate the Model's Prediction
cat("Note: The weight value is outside the range of the dataset, which\n",
    "limits the accuracy of the prediction. Use caution when interpreting\n",
    "this result.\n")