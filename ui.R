#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(shiny)
library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
dataset<- read.csv("dataset.csv")
dataset
audio_features <- dataset[, c("danceability", "energy", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo")]
ui<- navbarPage(
  "The Analysis of Spotify Music",
  tabPanel(
    "Introduction",
    fluidPage(
      titlePanel("Introduction"),
      sidebarLayout(
        sidebarPanel(
          tags$h6("Do musical characteristics such as danceability, energy levels, and valence scores correlate to a song's popularity? This study will analyze a dataset comprising information on the musical features, popularity ratings of numerous songs, and the relationships between music genres and audience preferences. We have tied the how trends within the music industry to inform commercial strategy or artistic decisionsconduct statistical analyses comparing the popularity of songs in various genres. This is important because it implies the presence of trends or patterns in the music industry that may inform commercial strategy or artistic decisions.", style= "font-size: 14px; font-weight: normal; line-height:1.5;"),
          img(src = "https://upload.wikimedia.org/wikipedia/commons/2/26/Spotify_logo_with_text.svg", height= 175, width=290)),
        mainPanel(
          h3("Our Final Project is based on the Spotify Tracks Dataset by the user maharshipandya. In this dataset, over 114,000 songs were collected and filtered by unique factors such as song name, artist name, popularity, song danceability and energy levels. With these various factors, our group is able to establish questions that have correlating trends from the collected data."),
          tags$h5("Our group found the Spotify data through the Google Datasets search, which can be found here:", tags$a(href= "https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset", "huggingface.co/datasets/maharshipandya/spotify-tracks-dataset."),
                    "The data was collected by the user named maharshipandya and cleaned using Spotify's Web API and Python.
                    The data was initially collected to build a recommendation system based on some listener's preference and to properly establish classification purposes based on audio features and available genres."),
          tags$h5("•	Do musical characteristics such as danceability and song energy levels correlate to popularity?"),
          tags$h5("•	Do high valence scores relate to a song’s popularity?"),
          tags$h5("•	Do certain musical genres produce more popular songs?"),
          tags$h5("•	Which artists have the highest popularity scores and is there a common trend?"),
          tags$h5("There are 114,000 rows in total."),
          tags$h5("There are 20 columns in total."),
          tags$h5("The possible implications of this project may affect  technologists, designers and policymakers. For technologists, the findings gives us additional information that we may use to improve the algorithm's efficiency. Understanding the links between music selections and their popularity, genre, instruments played, and other factors can also assist the algorithm improve music discovery and recommend new options. For designers, they might include the research findings into the user app interface and utilize this function to promote niche genres or styles that are underrepresented in mainstream media. Policymakers can utilize this information to understand the music industry better, which could lead to stronger business regulation and efforts to support artists through licensing and copyright."),
          tags$h5("There may be some challenges and limits with the dataset. Any minute mistakes or omissions in recording the song's timing, or a lack of information on when it was released. Another worry is the ethical considerations around the data. We don't know if the information was given with consent or if there were any privacy or representation issues. 
This dataset is based on a specific timeframe, and we must match the dataset's insight to the study questions based on that timeframe. The music industry undergoes numerous changes that are difficult to predict using the data we have. We will need more recent data to do this. We also don't know how the dataset rubrics were calculated. For example, the popularity of songs we know is graded from 0 to 100, but we don't know how the figures were computed.")
          )
        )
      )
    ),
  #Chart 1
  tabPanel(
    "Danceability vs. Energy",
    fluidPage(
      titlePanel("Danceability vs. Energy"),
      sidebarLayout(
        sidebarPanel(
          sliderInput("dance_min", "Danceability Min", min = min(dataset$danceability),
                      max = max(dataset$danceability), value = min(dataset$danceability)),
          sliderInput("dance_max", "Danceability Max", min = min(dataset$danceability),
                      max = max(dataset$danceability), value = max(dataset$danceability)),
          sliderInput("energy_min", "Energy Min", min = min(dataset$energy),                       max = max(dataset$energy), value = min(dataset$energy)),
          sliderInput("energy_max", "Energy Max", min = min(dataset$energy),
                      max = max(dataset$energy), value = max(dataset$energy)
          )),
        mainPanel(
          plotOutput("dance_vs_energy")
        )
      )
    )
  ),
  #Chart 2
  tabPanel(
    "Average & Total Popularity by Genre",
    fluidPage(
      titlePanel("Average & Total Popularity by Genre"),
      sidebarLayout(
        sidebarPanel(
          selectInput("num_genres", "Number of Genres to Compare", choices = 2:10),
          uiOutput("genre_select")),
        mainPanel(
          plotOutput("popularity_by_genre")
        )
      )
    )
  ),
  #Chart 3
  tabPanel(
    "Audio Feature Distribution",
    fluidPage(
      sidebarLayout(
        sidebarPanel(
          helpText("Explore the relationship of the frequency of the audio features."),
          selectInput(
            "feature",
            "Select Feature:",
            names("audio_features")
          ),
          sliderInput(
            "binwidth",
            "Bin Width:",
            min = 0.01,
            max = 0.5,
            value = 0.05,
            step = 0.01)
        ),
        mainPanel(
          plotOutput("histogram")
          )
        )
      )
    ),
  tabPanel(
    "Conclusion",
    fluidPage(
      titlePanel("Conclusion"),
      sidebarLayout(
        sidebarPanel(
          "Our exploration into the Spotify music dataset yielded several key takeaways that inform our understanding of the connections between musical characteristics and song popularity."),
        mainPanel(
          h4("1. Danceability and Energy Correlation with Popularity:"),
          tags$h5("Analyzing the distribution of danceability and energy levels revealed a positive correlation with song popularity. Songs with higher danceability and energy scores, on average, tend to be more popular as measured by Spotify. This aligns with our initial hypothesis and is supported by the visualization where the cluster of data points appears in the high danceability and high energy region. This finding suggests that listeners gravitate towards music that is upbeat and energetic, potentially due to the association with positive emotions and the desire to move or dance.We see that as we increase the dancebility and energy range the scatterplot appears to form a positive graph whereas when we decrease the maximum points 0.9985 and 1 respectively further making us understand the positive correlation."),
          h4("2. Genre Plays a Role in Popularity:"),
          tags$h5("By comparing average and total popularity across various genres, we observed that specific genres consistently rank higher. The second graph demonstrates this insight, where Pop leads with an average popularity of 47.5 with a total of 47576. Dance follows with an average popularity of 22.69 wiht a total of 22690 which is also appear at the top. This indicates that genre preferences play a significant role in how songs are perceived and consumed. It's important to acknowledge that popularity can be genre-specific, meaning a song might be highly popular within a particular genre but not necessarily achieve mainstream recognition.
"),
          h4("3. Audio Feature Distribution Offers Insights: "),
          tags$h5("Examining the distribution of various audio features using histograms provided a deeper understanding of the dataset's composition. For instance, the histogram for valence showed a positive skew, suggesting a prevalence of songs with positive emotional connotations. This aligns with the popularity of high-energy and danceable music, as positive emotions often accompany those characteristics. These histograms offered valuable insights into the dataset's makeup and potential listener preferences. For example, with the bin width of 0.5 both energibility which has a positive skewness and acousticness has an opposite skewness."),
          h4("The Most Important Insight"),
          tags$h5("The most significant insight from our analysis is the confirmation of a positive correlation between danceability, energy, and song popularity on Spotify. This finding is crucial because it directly links musical characteristics to listener preferences. It validates our initial hypothesis that listeners gravitate towards energetic and upbeat music, offering valuable knowledge for the music industry. Artists and producers can leverage this to create music that resonates better with audiences. Music streaming services can also use this insight to refine recommendation systems, prioritizing songs with higher danceability and energy for users with similar taste. This can lead to a more personalized and engaging user experience. The positive correlation is visually evident in the first graph's cluster of data points concentrated in the high danceability and high energy region. Overall, this takeaway highlights the importance of danceability and energy in shaping song popularity on streaming platforms."),
          h4("Broader Implications"),
          tags$h5("This exploration has broader implications for the music industry. By recognizing the influence of danceability and energy on popularity, artists and producers can make informed decisions about the direction of their music. Additionally, music streaming services can leverage this knowledge to refine their recommendation algorithms, leading to a more personalized and engaging user experience. Furthermore, policymakers can utilize this information to gain insights into listener preferences and potential biases within music streaming platforms."),
          tags$h5("In conclusion, our analysis of the Spotify music dataset shed light on the connections between musical characteristics and song popularity. The positive correlation between danceability and energy with popularity offers valuable insights for the music industry, informing creative decisions, recommendation systems, and potentially even music policy. As music continues to evolve, further exploration of these relationships will be crucial for understanding listener preferences and shaping the future of music consumption.")
        )
      )
    )
  )
)

server<- function(input, output, session){
}

shinyApp(ui,server, options = list(height=540))