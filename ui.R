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
options(encoding = "UTF-8")
dataset <- read.csv("dataset.csv")
dataset
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
          plotOutput("danceability_vs_energy")
        )
      )
    )
  ),
  tabPanel(
    "Average & Total Popularity by Genre",
    fluidPage(
      titlePanel("Average & Total Popularity by Genre"),
      sidebarLayout(
        sidebarPanel(
          selectInput("num_genres", "Number of Genres to Compare", choices = 2:10),
          plotOutput("genre_select")),
        mainPanel(
          plotOutput("popularity_by_genre")
        )
      )
    )
  ),
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
        step = 0.01
      )
      ),
      mainPanel(
        plotOutput("histogram")
      )
    )
  )
))


server<- function(input, output, session){
}

shinyApp(ui,server)