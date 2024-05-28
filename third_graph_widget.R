library(shiny)
library(ggplot2)

# Load the dataset (assuming the CSV is in your working directory)
dataset <- read.csv("dataset.csv")

# Select audio features
audio_features <- dataset[, c("danceability", "energy", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo")]

# Textual description - Add a comment explaining the chart's purpose
# This Shiny app allows users to explore the distribution of various audio features 
# present in a dataset by visualizing them as histograms. 

ui <- fluidPage(
  titlePanel("Audio Feature Distribution"),
  sidebarLayout(
    sidebarPanel(
      helpText("Explore the relationship of the frequency of the audio features."),
      selectInput(
        "feature",
        "Select Feature:",
        names(audio_features)
      ),
      sliderInput(
        "binwidth",
        "Bin Width:",
        min = 0.01,
        max = 0.5,
        value = 0.05,
        step = 0.01
      )
    ),
    mainPanel(
      plotOutput("histogram")
    )
  )
)

server <- function(input, output) {
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
}

shinyApp(ui = ui, server = server)