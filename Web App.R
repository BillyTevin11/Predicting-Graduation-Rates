# 1. Load required libraries
library(shiny)
library(bslib)  # For modern themes
library(tidyverse)

# 2. Define the UI with a beautiful theme
ui <- page_sidebar(
  # Setting a theme (Mint/Teal professional look)
  theme = bs_theme(
    version = 5,
    bootswatch = "minty", 
    primary = "#2c3e50", # Dark Navy
    secondary = "#18bc9c" # Teal
  ),
  
  title = "Everything Data Africa | Admissions Predictor",
  
  # Sidebar for Inputs
  sidebar = sidebar(
    title = "Applicant Profile",
    bg = "#f8f9fa",
    
    selectInput("track", "Target Track", 
                choices = c("Data Science", "Data Analytics")),
    
    selectInput("age", "Age Range", 
                choices = c("18-24 years", "25-34 years", "35-44 years", "45-54 years")),
    
    selectInput("skill", "Initial Skill Level", 
                choices = c("Beginner", "Elementary", "Intermediate", "Advanced")),
    
    selectInput("exp", "Work Experience", 
                choices = c("Less than six months", "6 months - 1 year", "1-3 years", "4-6 years")),
    
    selectInput("hours", "Commitment (Hours/Week)", 
                choices = c("less than 6 hours", "7-14 hours", "more than 14 hours")),
    
    selectInput("gender", "Gender", 
                choices = c("Male", "Female")),
    
    numericInput("score", "Entrance Test Score (%)", 
                 value = 70, min = 0, max = 100),
    
    input_task_button("predict", "Generate Likelihood Score", 
                      type = "primary", icon = icon("chart-line"))
  ),
  
  # Main Panel Layout
  layout_column_wrap(
    width = 1,
    
    # 1. Prediction Results Card
    card(
      full_screen = TRUE,
      card_header("Admission Probability Analysis"),
      card_body(
        class = "text-center",
        uiOutput("result_ui")
      )
    ),
    
    # 2. Insight Card
    card(
      card_header("Model Insights & Guidance"),
      card_body(
        p("This prediction is based on the Everything Data Africa graduation model."),
        tags$ul(
          tags$li("Experience is a high-weight factor in this cohort."),
          tags$li("Entrance scores are baseline indicators, but commitment hours are critical for success."),
          tags$li("Note: This is a statistical likelihood, not a final decision.")
        )
      )
    )
  )
)

# 3. Define the Server Logic
server <- function(input, output) {
  
  # Load the model (Ensure you saved the model as 'everything_data_model.rds' previously)
  model <- readRDS("everything_data_model.rds")
  
  # Logic to calculate prediction when button is clicked
  prediction_data <- eventReactive(input$predict, {
    # Prepare the input data frame
    data.frame(
      Track = factor(input$track, levels = c("Data Science", "Data Analytics")),
      Age_range = factor(input$age, levels = c("18-24 years", "25-34 years", "35-44 years", "45-54 years")),
      Skill_level = factor(input$skill, levels = c("Beginner", "Elementary", "Intermediate", "Advanced")),
      Experience = factor(input$exp, levels = c("Less than six months", "6 months - 1 year", "1-3 years", "4-6 years")),
      Hours_per_week = factor(input$hours, levels = c("less than 6 hours", "7-14 hours", "more than 14 hours")),
      Gender = factor(input$gender, levels = c("Male", "Female")),
      Country = factor("Kenya", levels = c("Kenya", "South Africa")),
      Test_completed = factor("Yes", levels = c("Yes", "No")),
      Total_score = input$score
    )
  })
  
  output$result_ui <- renderUI({
    req(prediction_data())
    
    # Run the model
    prob <- predict(model, newdata = prediction_data(), type = "response")
    prob_pct <- round(prob * 100, 1)
    
    # Determine color and status
    color <- if(prob_pct >= 70) "#18bc9c" else if(prob_pct >= 40) "#f39c12" else "#e74c3c"
    status <- if(prob_pct >= 70) "High Likelihood of Graduation" else if(prob_pct >= 40) "Moderate Success Probability" else "High Risk of Non-Completion"
    
    # Return beautiful HTML UI
    div(
      style = paste0("padding: 20px; border-radius: 15px; border: 2px solid ", color, ";"),
      h1(style = paste0("color: ", color, "; font-weight: bold; font-size: 60px;"), 
         paste0(prob_pct, "%")),
      h3(status),
      hr(),
      p(style = "font-style: italic; color: #7f8c8d;", 
        paste("Recommendation:", ifelse(prob_pct >= 60, "PROCEED WITH ADMISSION", "FURTHER INTERVIEW REQUIRED")))
    )
  })
}

# 4. Launch the App
shinyApp(ui = ui, server = server)