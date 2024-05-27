library(readr)
library(ggplot2) 

dataset <- read.csv("dataset.csv")

ggplot(dataset, aes(x = danceability, y = energy)) +
  geom_point() +
  labs(title = "Danceability vs. Energy",
       x = "Danceability", y = "Energy")
print (ggplot)


# Purpose - The graph helps identify the relationship between the two variables Energy and Danceability. It helps us visualize the common perception that higher energy songs are like to have high danceability. Since both the variable are numbers using a scatter plot also helps understadn the relationship much better

# Insights - We see from the graph that there seems to be a positive relationship between the two variables. Though we see a lot of data crowded between 0.25-0.75 of the dancebility we can assume they fall in the normal bell shaped curves. We may conclude that most of the songs have a good energy hence resulting in danceability. But we may also say that due to the song having high danceability people assume it to have high energy. Hence, we know they share a positive relationship but we cannot assume one cause the other since there are several factors that contribute into this relationship. 