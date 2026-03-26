# ==============================================================================
# SCRIPT 2: EXPLORATORY DATA ANALYSIS (EDA)
# ==============================================================================
# WHAT: This script visualizes our clean data to find patterns and correlations.
# WHY:  Models are blind; they only see math. We use EDA to visually verify 
#       which features (like smoking or BMI) have the biggest impact on our 
#       target variable (charges). This helps us explain the "why" to stakeholders.
# HOW:  We use 'ggplot2' (included in tidyverse) to build professional plots.
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SETUP & LOAD DATA
# ------------------------------------------------------------------------------
library(tidyverse)

# Load the CLEANED data. 
# Note: CSV files cannot store "factor" metadata, so they revert to text when saved.
# We must quickly re-apply our factor conversions so our plots group correctly.
df <- read_csv("data/processed/clean_medical_insurance.csv", show_col_types = FALSE) |>
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region)
  )

# ------------------------------------------------------------------------------
# 2. TARGET VARIABLE DISTRIBUTION (The "Y" Variable)
# ------------------------------------------------------------------------------
# WHAT: A histogram showing the distribution of medical charges.
# WHY:  We need to know what our "normal" costs look like. Are most people 
#       paying a little, or a lot?
# HOW:  geom_histogram() cuts the data into bins and counts the occurrences.

p1 <- ggplot(df, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  theme_minimal() +
  labs(
    title = "Distribution of Medical Insurance Charges",
    subtitle = "Most patients have lower charges, with a long tail of high-cost outliers.",
    x = "Total Charges ($)",
    y = "Number of Patients"
  )
print(p1)
ggsave("outputs/charge_distribution.png", plot = p1, width = 8, height = 5, dpi = 300)

# ------------------------------------------------------------------------------
# 3. CATEGORICAL IMPACT: Smoking Status vs. Charges
# ------------------------------------------------------------------------------
# WHAT: A boxplot comparing the costs of smokers vs. non-smokers.
# WHY:  Domain knowledge suggests smoking heavily impacts health costs. 
#       We want to visually prove or disprove this hypothesis.
# HOW:  geom_boxplot() shows the median, quartiles, and outliers of the data.

p2 <- ggplot(df, aes(x = smoker, y = charges, fill = smoker)) +
  geom_boxplot(alpha = 0.7) +
  theme_minimal() +
  scale_fill_manual(values = c("yes" = "firebrick", "no" = "forestgreen")) +
  labs(
    title = "Insurance Charges: Smokers vs. Non-Smokers",
    subtitle = "Smoking appears to be a massive driver of insurance costs.",
    x = "Smoker Status",
    y = "Total Charges ($)"
  )
print(p2)
ggsave("outputs/smoker_boxplot.png", plot = p2, width = 8, height = 5, dpi = 300)

# ------------------------------------------------------------------------------
# 4. CONTINUOUS IMPACT: Age & BMI vs. Charges
# ------------------------------------------------------------------------------
# WHAT: A scatter plot showing how Body Mass Index (BMI) and Age relate to costs, 
#       split by smoking status.
# WHY:  This is where we look for complex, multi-variable relationships. Does a 
#       high BMI cost more? Does it matter if they smoke?
# HOW:  geom_point() places the dots, and mapping 'color = smoker' adds a 3rd dimension.

p3 <- ggplot(df, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", se = FALSE) + # Adds a linear trend line
  theme_minimal() +
  scale_color_manual(values = c("yes" = "firebrick", "no" = "forestgreen")) +
  labs(
    title = "Impact of BMI on Charges, Segmented by Smoking Status",
    subtitle = "For non-smokers, BMI has a small impact. For smokers, high BMI skyrockets costs.",
    x = "Body Mass Index (BMI)",
    y = "Total Charges ($)"
  )
print(p3)

# ------------------------------------------------------------------------------
# 5. EXPORT PLOTS 
# ------------------------------------------------------------------------------
# WHAT: Save our best plot to the 'outputs' folder.
# WHY:  We can use this high-quality image file in presentations or reports later.
# HOW:  ggsave() automatically saves the last printed plot.

ggsave("outputs/bmi_smoker_impact.png", plot = p3, width = 8, height = 5, dpi = 300)
print("EDA complete! Check your plot viewer and the outputs folder.")