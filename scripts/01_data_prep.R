# ==============================================================================
# SCRIPT 1: DATA INGESTION & PREPROCESSING
# ==============================================================================
# WHAT: This script loads the raw insurance data, cleans it, and prepares it
#       for exploratory data analysis (EDA) and machine learning.
# WHY:  Raw data is rarely ready for modeling. Algorithms need categorical
#       variables (like "yes"/"no") to be properly formatted as "factors".
# HOW:  We use the 'tidyverse' package, which is the industry standard for
#       data manipulation in R.
# ==============================================================================


# ------------------------------------------------------------------------------
# 1. SETUP & PACKAGE LOADING
# ------------------------------------------------------------------------------
# If you don't have the tidyverse installed, remove the '#' on the next line and run it once:
install.packages("tidyverse")
# Load the library into our current session
library(tidyverse)

# ------------------------------------------------------------------------------
# 2. DATA INGESTION
# ------------------------------------------------------------------------------
# WHAT: Read the CSV file from our raw data folder.
# WHY:  We need to load the data into R's memory (RAM) as a "dataframe"
#       (think of it as an advanced Excel spreadsheet) to manipulate it.
# HOW:  Using 'read_csv()' which is faster and smarter than base R's 'read.csv()'.

raw_df <- read_csv("data/raw/medical_insurance.csv")

# -----------------------------------------------------------------------------
# 3. INITIAL INSPECTION
# ------------------------------------------------------------------------------
# WHAT: Look at the structure of the data.
# WHY:  To ensure it loaded correctly and to see what data types R assigned
#       to each column (e.g., numeric, character).

print("--- Data Structure ---")
glimpse(raw_df)

# Check for missing values (NAs) in the entire dataset
# WHY: Machine learning models will crash if they encounter missing data.
missing_values <- sum(is.na(raw_df))
print(paste("Total missing values in dataset:", missing_values))

# ------------------------------------------------------------------------------
# 4. DATA TRANSFORMATION & CLEANING
# ------------------------------------------------------------------------------
# WHAT: Convert text columns (characters) into
#           "Factors" (categorical variables).
# WHY:  A computer doesn't know what "smoker"
#           and "non-smoker" means. By converting
#       them to factors, R assigns them internal numeric levels (e.g., 0 and 1)
#       so statistical models can process them mathematically.
# HOW:  We use the 'mutate()' function to overwrite the columns with their
#       factorized versions.

clean_df <- raw_df |>
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region)
  )

# Verify the changes:
#  You should now see 'fct' (factor) instead of 'chr' (character)
print("--- Cleaned Data Structure ---")
glimpse(clean_df)

# Let's look at a statistical summary of our clean data
print("--- Statistical Summary ---")
summary(clean_df)

# ------------------------------------------------------------------------------
# 5. EXPORTING PROCESSED DATA
# ------------------------------------------------------------------------------
# WHAT: Save this cleaned dataframe into our 'processed' folder.
# WHY:  In our next scripts (EDA and Modeling),
#       we will load THIS clean dataset.
#       We never overwrite the raw data. This preserves our exact steps.
# HOW:  Using 'write_csv()'.

write_csv(clean_df, "data/processed/clean_medical_insurance.csv")

print("Data preprocessing complete! Clean data saved to data/processed/")