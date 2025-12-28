# Load libraries and model
library(tidyverse)
model <- readRDS("everything_data_model.rds")

# Function to predict for a new applicant
predict_graduation <- function(new_data) {
  # Ensure input data has the same factor levels as the training data
  # (R requires the exact same levels to make a prediction)
  
  prob <- predict(model, newdata = new_data, type = "response")
  
  result <- ifelse(prob > 0.5, "Likely to Graduate", "At Risk / Unlikely")
  return(list(Probability = round(prob * 100, 2), Result = result))
}

# Example: Predicting for a New Applicant
new_applicant <- data.frame(
  Track = factor("Data Science", levels = c("Data Science", "Data Analytics")),
  Age_range = factor("25-34 years", levels = c("18-24 years", "25-34 years", "35-44 years", "45-54 years")),
  Skill_level = factor("Beginner", levels = c("Beginner", "Elementary", "Intermediate", "Advanced")),
  Experience = factor("Less than six months", levels = c("Less than six months", "6 months - 1 year", "1-3 years", "4-6 years")),
  Hours_per_week = factor("7-14 hours", levels = c("less than 6 hours", "7-14 hours", "more than 14 hours")),
  Gender = factor("Female", levels = c("Male", "Female")),
  Country = factor("Kenya", levels = c("Kenya", "South Africa")),
  Test_completed = factor("Yes", levels = c("Yes", "No")),
  Total_score = 75.5
)

predict_graduation(new_applicant)
