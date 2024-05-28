install.packages("shiny")
library(shiny)
library(ggplot2)
library(dplyr)

# Load your dataset 
dataset <- read.csv("dataset.csv")

# Define the UI for the Shiny app
ui <- fluidPage(
  titlePanel("Danceability vs. Energy"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore the relationship between danceability and energy in music tracks. 
                Use the sliders to adjust the desired range for each."),
      sliderInput("dance_min", "Danceability Min", min = min(dataset$danceability), 
                  max = max(dataset$danceability), value = min(dataset$danceability)),
      sliderInput("dance_max", "Danceability Max", min = min(dataset$danceability), 
                  max = max(dataset$danceability), value = max(dataset$danceability)),
      sliderInput("energy_min", "Energy Min", min = min(dataset$energy), 
                  max = max(dataset$energy), value = min(dataset$energy)),
      sliderInput("energy_max", "Energy Max", min = min(dataset$energy), 
                  max = max(dataset$energy), value = max(dataset$energy))
    ),
    mainPanel(
      plotOutput("dance_vs_energy")
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output) {
  output$dance_vs_energy <- renderPlot({
    filtered_data <- dataset %>%
      filter(danceability >= input$dance_min & danceability <= input$dance_max &
               energy >= input$energy_min & energy <= input$energy_max)
    
    ggplot(filtered_data, aes(x = danceability, y = energy)) +
      geom_point() +
      labs(title = "Danceability vs. Energy",
           x = "Danceability", y = "Energy")
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
