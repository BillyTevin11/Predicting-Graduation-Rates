# 1. Load necessary libraries
library(tidyverse)
library(caret)

# 2. Load the dataset
data <- read.csv("data.csv")

# 3. Data Preprocessing with Explicit Level Ordering
df <- data %>%
  mutate(
    # Target variable: 'No' will be 0, 'Yes' will be 1
    Graduated = factor(Graduated, levels = c("No", "Yes")),
    
    # Predictors with specific ordering
    Track = factor(Track, levels = c("Data Science", "Data Analytics")),
    
    Age_range = factor(Age_range, levels = c("18-24 years", "25-34 years", 
                                             "35-44 years", "45-54 years")),
    
    Skill_level = factor(Skill_level, levels = c("Beginner", "Elementary", 
                                                 "Intermediate", "Advanced")),
    
    Experience = factor(Experience, levels = c("Less than six months", "6 months - 1 year", 
                                               "1-3 years", "4-6 years")),
    
    Hours_per_week = factor(Hours_per_week, levels = c("less than 6 hours", "7-14 hours", 
                                                       "more than 14 hours")),
    
    Gender = factor(Gender, levels = c("Male", "Female")),
    
    Test_completed = factor(Test_completed, levels = c("No", "Yes"))
  ) %>%
  # Select only the columns needed for the model
  select(Graduated, Skill_level, Experience, 
         Hours_per_week, Total_score) %>%
  drop_na()

# Assessing Factor Levels for Categorical Features in the Data
levels(df$Age_range)
levels(df$Gender)
levels(df$Experience)
levels(df$Track)
levels(df$Hours_per_week)
levels(df$Skill_level)
levels(df$Test_completed)


# 4. Split the data (70% Train, 30% Test)
set.seed(123)
index <- createDataPartition(df$Graduated, p = 0.7, list = FALSE)
train_set <- df[index, ]
test_set <- df[-index, ]

# 5. Fit the Logistic Regression Model
model <- glm(Graduated ~ ., data = train_set, family = "binomial")

# 6. View Results
summary(model)


# 7. Predictions and Evaluation
test_set$prob <- predict(model, newdata = test_set, type = "response")
test_set$prediction <- ifelse(test_set$prob > 0.5, "Yes", "No")
test_set$prediction <- factor(test_set$prediction, levels = c("No", "Yes"))

# Confusion Matrix
confusionMatrix(test_set$prediction, test_set$Graduated)




# Train on the full dataset
final_model <- glm(Graduated ~ ., data = df, family = "binomial")

# Save the model to a file
saveRDS(final_model, "everything_data_model.rds")
