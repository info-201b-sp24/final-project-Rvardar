
# Load the necessary libraries
library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
dataset <- read.csv("dataset.csv")

avg_popularity <- aggregate(popularity ~ track_genre, data = dataset, FUN = mean)

# New aggregation to sum up popularity if track_genre is the same
sum_popularity <- dataset %>%
  group_by(track_genre) %>%
  summarise(total_popularity = sum(popularity))

# Combine both aggregations
combined_popularity <- left_join(avg_popularity, sum_popularity, by = "track_genre")

# Step 4: Create the bar chart using ggplot2
ggplot(combined_popularity, aes(y = track_genre, x = popularity)) +
  geom_bar(stat = "identity", fill = "skyblue", width = 0.7) + # Adjust width for space between bars
  geom_text(aes(label = track_genre), position = position_dodge(width = 0.7), vjust = -0.2, color = "black", size = 3) +  # Add text labels for total popularity
  theme_minimal() +
  labs(title = "Average and Total Popularity by Genre",
       y = "Genre",
       x = "Popularity")

#Purpose - We decided to use a bar graph for the depiction between genre and popularity as it helps in to comparing different groups or track changes over time. It explains the complex data and gives us an overview of what type of music is the most popular. 
#Insights - As we see from the following bar graph, the top six genres from most popular to the least are Pop-film, K-pop, chill, sad,grunge and Indian. The least popular genres are romance, Iranian.This helps us understand how people would mostly react to the various genres.
