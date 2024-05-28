# Libraries required for the Shiny app
library(shiny)
library(dplyr) # for data manipulation
library(ggplot2) # for creating charts
library(readr) # for reading CSV files
library(tidyverse) # combines commonly used packages

# Load your dataset (replace "dataset.csv" with your actual file path)
dataset <- read.csv("dataset.csv")

# Define the user interface (UI) for the Shiny app
ui <- fluidPage(
  # Title for the app
  titlePanel("Average & Total Popularity by Genre"),
  
  # Layout with sidebar and main panel
  sidebarLayout(
    sidebarPanel(
      helpText("Explore the comparison of popularity between different genres"),
      # Dropdown menu to choose the number of genres to compare (2 to 10)
      selectInput("num_genres", "Number of Genres to Compare", choices = 2:10),
      # Dynamically generated genre selection dropdowns will be placed here
      uiOutput("genre_select")
    ),
    mainPanel(
      # This section will display the chart
      plotOutput("popularity_by_genre")
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output) {
  # Generate genre selection dropdowns based on user choice
  output$genre_select <- renderUI({
    genre_choices <- unique(dataset$track_genre) # Get unique genres from the data
    num_genres <- input$num_genres # Get the number of genres chosen
    
    # Create dropdown menus for each selected genre
    lapply(seq_len(num_genres), function(i) {
      selectInput(paste0("genre_", i), paste0("Genre ", i), choices = genre_choices)
    })
  })
  
  # Render the chart based on selected genres
  output$popularity_by_genre <- renderPlot({
    selected_genres <- lapply(seq_len(input$num_genres), function(i) input[[paste0("genre_", i)]]) # Get selected genres
    
    # Filter data based on selected genres
    filtered_data <- dataset %>%
      filter(track_genre %in% selected_genres)
    
    # Calculate average popularity for each genre
    avg_popularity <- aggregate(popularity ~ track_genre, data = filtered_data, FUN = mean)
    
    # Calculate total popularity for each genre
    sum_popularity <- filtered_data %>%
      group_by(track_genre) %>%
      summarise(total_popularity = sum(popularity))
    
    # Combine average and total popularity data
    combined_popularity <- left_join(avg_popularity, sum_popularity, by = "track_genre")
    
    # Create the bar chart
    ggplot(combined_popularity, aes(y = track_genre, x = popularity)) +
      geom_bar(stat = "identity", fill = "pink", width = 0.7) +  # Draw bars
      geom_text(  # Add hover text with average and total popularity
        aes(label = paste0("Average:", round(popularity, 2), "\nTotal:", sum_popularity[sum_popularity$track_genre == track_genre,]$total_popularity)),
        position = position_dodge(width = 0.7), vjust = -0.2, color = "black", size = 3
      ) +
      scale_y_discrete(limits = sort(unique(combined_popularity$track_genre), decreasing = TRUE)) + # Sort genres alphabetically
      theme_minimal() +  # Improve chart aesthetics
      labs(  # Add chart labels
        title = "Average and Total Popularity by Genre",
        y = "Genre",
        x = "Popularity"
      )
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
