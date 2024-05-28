library(shiny)
library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)

# Load your dataset (replace "dataset.csv" with your actual file path)
dataset <- read.csv("dataset.csv")

# Define UI for the Shiny app
ui <- fluidPage(
  titlePanel("Average & Total Popularity by Genre"),
  sidebarLayout(
    sidebarPanel(
      selectInput("num_genres", "Number of Genres to Compare", choices = 2:10),  # Allow 2 to 5 genres for comparison
      uiOutput("genre_select")  # Dynamically generated genre selection dropdowns
    ),
    mainPanel(
      plotOutput("popularity_by_genre")
    )
  )
)

# Define server logic for the Shiny app
server <- function(input, output) {
  # Reactive function to generate genre selection dropdowns based on user choice
  output$genre_select <- renderUI({
    genre_choices <- unique(dataset$track_genre)
    num_genres <- input$num_genres
    lapply(seq_len(num_genres), function(i) {
      selectInput(paste0("genre_", i), paste0("Genre ", i), choices = genre_choices)
    })
  })
  
  # Render plot based on selected genres
  output$popularity_by_genre <- renderPlot({
    selected_genres <- lapply(seq_len(input$num_genres), function(i) input[[paste0("genre_", i)]])
    filtered_data <- dataset %>%
      filter(track_genre %in% selected_genres)  # Filter by selected genres
    
    avg_popularity <- aggregate(popularity ~ track_genre, data = filtered_data, FUN = mean)
    
    sum_popularity <- filtered_data %>%
      group_by(track_genre) %>%
      summarise(total_popularity = sum(popularity))
    
    combined_popularity <- left_join(avg_popularity, sum_popularity, by = "track_genre")
    
    ggplot(combined_popularity, aes(y = track_genre, x = popularity)) +
      geom_bar(stat = "identity", fill = "skyblue", width = 0.7) +
      geom_text(aes(label = track_genre), position = position_dodge(width = 0.7), vjust = -0.2, color = "black", size = 3) +
      scale_y_discrete(limits = sort(unique(combined_popularity$track_genre), decreasing = TRUE)) +  # Sort genres alphabetically
      theme_minimal() +
      labs(title = "Average and Total Popularity by Genre",
           y = "Genre",
           x = "Popularity")
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
