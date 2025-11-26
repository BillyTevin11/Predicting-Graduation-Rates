# Predictive Modelling Everything Data Africa's Graduation Rate

## Project Overview
This project provides a comprehensive analysis of participant data from the Everything Data mentorship program cohort. The analysis aims to understand participant demographics, identify factors influencing graduation rates, and provide actionable recommendations for improving future mentorship cohorts.

Track: Data Science

Dataset: 115 participants from mentorship cohort

Objective: Graduation Rate Predictive Modeling and Program Optimization


Dataset Description

Data Source

• File Name: data.csv

• Records: 115 participants

• Time Period: November 2024 - December 2024

• Geographic Focus: Primarily Kenya-based participants



## Column Structure (15 Features)
1. Timestamp - Application Submission Date and Time
2. ID No. - Unique Participant Identifier
3. Age range - Categorical Age Groups (18-24, 25-34, 35-44, 45-54 years)
4. Gender - Male/Female
5. Country - Participant location
6. Where did you hear about Everything Data? - Recruitment Source
7. Years of learning experience - Prior data field experience level
8. Track applied for - Data Science or Data Analysis
9. Hours per Week Available - Weekly time commitment
10. Main aim for joining - Primary motivation category
11. Motivation - Detailed motivation description
12. Self-assessed skill level - Beginner/Elementary/Intermediate/Advanced
13. Aptitude test completion - Yes/No
14. Total score - Aptitude test score (0-100)
15. Graduated - Target variable (Yes/No)

## Technical Requirements
Dependencies
python
pandas>=1.3.0
numPy>=1.21.0
matplotlib>=3.4.0
seaborn>=0.11.0
scikit-learn>=1.0.0

Installation
pip install pandas numPy matplotlib seaborn scikit-learn

## Workflow Methodology
### Phase 1: Data Loading and Initial Exploration
Objective: Understand dataset structure and quality
Steps:
1. Data Import

  o Load CSV file using pandas
  
  o Verify dataset dimensions and structure
  
  o Display first few records for initial inspection

2. Data Quality Assessment

  o Check for missing values across all columns
  
  o Identify data types and potential inconsistencies
  
  o Examine unique values in categorical columns
  
  o Calculate basic descriptive statistics

3. Initial Insights

  o Document dataset size and scope
  
  o Identify potential data quality issues
  
  o Note any obvious patterns or anomalies

Key Outputs:
• Dataset overview summary
• Missing value report
• Data type analysis
• Initial observations


### Phase 2: Data Cleaning and Preprocessing

Objective: Prepare clean, analysis-ready dataset

Steps:

1. Temporal Data Processing

  o Convert timestamp strings to datetime objects
  
  o Extract additional time-based features if needed

2. Binary Variable Encoding

  o Convert 'Graduated' to numeric (1/0)
  
  o Convert 'Test_completed' to numeric (1/0)

3. Categorical Variable Mapping

  o Create ordinal mappings for experience levels:

    ▪ Less than six months = 0
    
    ▪ 6 months - 1 year = 1

    ▪ 1-3 years = 2
    
    ▪ 4-6 years = 3

  o Map weekly hours commitment:

    ▪ less than 6 hours = 1
    
    ▪ 7-14 hours = 2
    
    ▪ more than 14 hours = 3

  o Encode skill levels:

    ▪ Beginner = 1
    
    ▪ Elementary = 2
    
    ▪ Intermediate = 3
    
    ▪ Advanced = 4

  o Map age ranges:

    ▪ 18-24 years = 1
    
    ▪ 25-34 years = 2
    
    ▪ 35-44 years = 3
    
    ▪ 45-54 years = 4

4. Missing Value Treatment

  o Impute missing numeric values with median
  
  o Handle categorical missing values appropriately
  
  o Document imputation decisions

5. Feature Engineering

  o Create additional encoded variables for modeling
  
  o Generate derived features if beneficial

Key Outputs:
• Clean, preprocessed dataset
• Feature encoding documentation
• Data transformation summary

### Phase 3: Exploratory Data Analysis (EDA)

Objective: Understand patterns, relationships, and distributions

Steps:

1. Demographic Analysis

  o Age distribution visualization
  
  o Gender composition analysis
  
  o Geographic distribution (country-wise)
  
  o Track preference analysis

2. Experience and Commitment Analysis

  o Prior experience level distribution
  
  o Weekly time commitment patterns
  
  o Self-assessed skill level analysis
  
  o Recruitment source effectiveness

3. Performance Analysis

  o Aptitude score distribution and statistics
  
  o Overall graduation rate calculation
  
  o Graduation rates by different segments: 

  ▪ By track (Data Science vs Data Analysis)

    ▪ By experience level
    
    ▪ By time commitment
    
    ▪ By skill level

4. Correlation Analysis

  o Correlation matrix for numeric variables
  
  o Relationship between features and graduation
  
  o Identify potential multicollinearity issues

Visualizations Created:

• Bar charts for categorical distributions

• Histograms for continuous variables

• Pie charts for proportional data

• Heatmaps for correlations

• Cross-tabulation analyses

Key Outputs:
• Comprehensive statistical summary
• Visual insights into data patterns
• Correlation analysis results
• Segment-wise graduation rates

### Phase 4: Predictive Modeling

Objective: Build models to predict graduation likelihood for Everything Data Africa trainees

Steps:

1. Feature Selection

  o Select relevant features for modeling:

    ▪ Age_numeric
    
    ▪ Experience_numeric
    
    ▪ Hours_numeric
    
    ▪ Skill_numeric
    
    ▪ Total_score
    
    ▪ Test_completed
    
    ▪ Track_encoded
    
    ▪ Gender_encoded

2. Data Preparation

  o Define feature matrix (X) and target variable (y)
  
  o Check class distribution for imbalance
  
  o Split data into training/testing sets (80/20)
  
  o Apply stratified sampling to maintain class distribution

3. Feature Scaling

  o Apply StandardScaler to normalize feature ranges
  
  o Fit scaler on training data only
  
  o Transform both training and test sets

4. Model Selection and Training

  o Model 1: Logistic Regression

    ▪ Linear model suitable for binary classification
    
    ▪ Provides interpretable coefficients
    
    ▪ Good baseline performance

  o Model 2: Random Forest Classifier

    ▪ Ensemble method handling non-linear relationships
    
    ▪ Provides feature importance scores
    
    ▪ Robust to outliers

5. Model Training Process

  o Fit models on scaled training data
  
  o Generate predictions on test set
  
  o Calculate prediction probabilities for analysis

Key Outputs:
• Trained model objects
• Training/test split documentation
• Feature scaling parameters

### Phase 5: Model Evaluation and Comparison

Objective: Assess model performance and select best approach

Steps:

1. Performance Metrics Calculation

  o Accuracy: Overall prediction correctness
  
  o Precision: True positive rate (weighted average)
  
  o Recall: Sensitivity (weighted average)
  
  o F1-Score: Harmonic mean of precision and recall

2. Detailed Evaluation

  o Classification reports for both models
  
  o Confusion matrices visualization
  
  o Model comparison across all metrics

3. Feature Importance Analysis

  o Extract feature importance from Random Forest
  
  o Rank features by predictive power
  
  o Visualize importance scores

4. Model Interpretation

  o Identify most influential factors for graduation
  
  o Understand model decision-making process
  
  o Document model limitations and assumptions

Evaluation Visualizations:

  • Confusion matrix heatmaps
  
  • Feature importance bar charts
  
  • Model comparison charts
  
  • Performance metrics dashboard

Key Outputs:
• Comprehensive model evaluation report
• Feature importance rankings
• Best model selection
• Performance benchmarks

### Phase 6: Insights Generation and Recommendations

Objective: Transform analysis into actionable insights

Steps:

1. Statistical Insights Extraction

  o Key demographic patterns
  
  o Success factor identification
  
  o Performance trend analysis
  
  o Risk factor recognition

2. Business Intelligence Generation

  o Graduation rate benchmarks
  
  o Optimal participant profiles
  
  o Resource allocation insights
  
  o Program effectiveness metrics

3. Recommendation Development

  o Selection Criteria Optimization

    ▪ Aptitude score thresholds
    
    ▪ Experience level preferences
    
    ▪ Time commitment requirements

  o Program Structure Improvements

    ▪ Support level customization
    
    ▪ Track-specific approaches
    
    ▪ Intervention strategies

  o Recruitment Strategy Enhancement

    ▪ Channel effectiveness optimization
    
    ▪ Target audience refinement
    
    ▪ Marketing message improvement

4. Impact Assessment

  o Quantify potential improvements
  
  o Cost-benefit considerations
  
  o Implementation feasibility

Key Outputs:
• Executive summary of findings
• Prioritized recommendation list
• Implementation roadmap
• Success metrics definition






## Contact Information

### Project Author: Tevin Billy Ochieng

### Track: Data Science (Everything Data Africa - Cohort 4, 2025)

### Submission Date: September 28TH, 2025

### Email: vindevon11@gmail.com

# License
This project is developed for the Everything Data Mentorship Program Evaluation. All rights reserved.
