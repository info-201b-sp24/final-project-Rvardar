
# Download the dataset and read it into R
dataset <- read.csv("dataset.csv")

# Select the columns for the audio features
audio_features <- dataset[, c("danceability", "energy", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo")]

# Create histograms for each audio feature
histograms <- lapply(names(audio_features), function(feature) {
  ggplot(dataset, aes_string(x = feature)) +
    geom_histogram(binwidth = 0.05, fill = "skyblue", color = "black", alpha = 0.7) +
    labs(title = paste("Histogram of", feature),
         x = feature,
         y = "Frequency") +
    theme_minimal()
})

# Arrange histograms in a grid
grid.arrange(grobs = histograms, ncol = 2)

#Purpose -  The graphs help us analyze the distribution of various audio features within a datasheet and visualize them using histograms.We can use these graphs to infer the distribution and range of values for all the audios. It also helps give us a deeper analysis into the various categories and identify the patterns or any specific trends
# Insights - We see that overall as per dancebility, energy and valence all have high frequency in most of the songs. Whereas, speechiness, acousticness, instrumentalness, liveness all have a negitive relationship meaning that their frequency decreases as the songs become more popular. While onlt the tempo follows a normal bell curve where most of the songs fall in the 50% of the graph.