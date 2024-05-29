#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(shiny)
library(tidyverse)
library(ggplot2)
library(stringr)

dataset<- read.csv("dataset.csv")
dataset
server <- shinyServer(function(input, output) {
  output$dance_vs_energy <- renderPlot({
    filtered_data <- dataset %>%
      filter(danceability >= input$dance_min & danceability <= input$dance_max & energy >= input$energy_min & energy <= input$energy_max)
    ggplot(filtered_data, aes_string(x = danceability, y = energy)) +
      geom_point() +
      labs(title = "Danceability vs. Energy",
           x = "Danceability", y = "Energy")
  })
  output$genre_select <- renderPlot({
    genre_choices <- unique(dataset$track_genre)
    num_genres <- input$num_genres
    lapply(seq_len(num_genres), function(i) {
      selectInput(paste0("genre_", i), paste0("Genre ", i), choices = genre_choices)
    })
  })
  output$popularity_by_genre <- renderPlot({
    selected_genres <- lapply(seq_len(input$num_genres), function(i)
      input[[paste0("genre_", i)]])
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
  output$histogram <- renderPlot({
    selected_feature <- input$feature
    bin_width <- input$binwidth
    ggplot(dataset, aes_string(x = selected_feature)) +
        geom_histogram(binwidth = bin_width, fill = "skyblue", color = "black", alpha = 0.7, aes(tooltip = paste(x, ..count.., sep=": "))) +  # Add tooltip aesthetics
      labs(title = paste("Histogram of", selected_feature),
           x = selected_feature,
           y = "Frequency") +
      theme_minimal()
  })
})

  
  
