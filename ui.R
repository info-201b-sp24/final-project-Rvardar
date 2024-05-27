#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)
library(ggplot)
library(stringr)

dataset <- read.csv(dataset.csv)
ui<- navbarPage("The Analysis of Spotify Music")
tabPanel("Introduction")
fluidPage(
    titlePanel("Introduction"),
    sidebarLayout(
        sidebarPanel(
            tags$h3("Do musical characteristics such as danceability, energy levels, and valence scores correlate to a song's popularity? This question is important because understanding the relationship between various musical aspects and track popularity might provide useful insights into listener tastes and behaviour. To address the question, we will analyze a dataset comprising information on the musical features and popularity ratings of numerous songs. We are concerned with identifying if certain musical genres yield more popular songs since it can shed light on the relationships between music genres and audience preferences, potentially altering business practices and artist strategies. To address this concern, we plan to conduct statistical analyses comparing the popularity of songs in various genres. Consider how certain musicians constantly receive greater popularity scores. This is important because it implies the presence of trends or patterns in the music industry that may inform commercial strategy or artistic decisions. Accordingly, we plan to investigate the features and attributes shared by artists with high popularity scores to better understand their impact on audience reaction.", style= "font-size: 14px; font-weight: normal; line-height:1.5;"),
            img(src = "https://upload.wikimedia.org/wikipedia/commons/2/26/Spotify_logo_with_text.svg", height= 175, width=290)
        ),
        mainPanel(
            h3("Our Final Project is based on the Spotify Tracks Dataset by the user maharshipandya. In this dataset, over 114,000 songs were collected and filtered by unique factors such as song name, artist name, popularity, song danceability and energy levels. With these various factors, our group is able to establish questions that have correlating trends from the collected data."),
            tags$h3("Our group found the Spotify data through the Google Datasets search, which can be found here: https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset:", tags$a(href= "https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset", "https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset"),
                    "The data was collected by the user named maharshipandya and cleaned using Spotify's Web API and Python.
                    The data was initially collected to build a recommendation system based on some listener's preference and to properly establish classification purposes based on audio features and available genres."),
           tags$h3("•	Do musical characteristics such as danceability and song energy levels correlate to popularity?"),
           tags$h3("•	Do high valence scores relate to a song’s popularity?"),
           tags$h3("•	Do certain musical genres produce more popular songs?"),
           tags$h3("•	Which artists have the highest popularity scores and is there a common trend?"),
           tags$h3("There are 114,000 rows in total."),
           tags$h3("There are 20 columns in total."),
           tags$h3("The possible implications of this project may affect  technologists, designers and policymakers. For technologists, the findings from the study can be used to improve algorithm recommendations. It also gives us additional information that we may use to improve the algorithm's efficiency. Understanding the links between music selections and their popularity, genre, instruments played, and other factors can also assist the algorithm improve music discovery and recommend new options. For designers, they might include the research findings into the user app interface. For example, put popular tracks first or include them in recommended albums. Designers can utilize this function to promote niche genres or styles that are underrepresented in mainstream media. Policymakers can utilize this information to understand the music industry better. This could lead to stronger business regulation and efforts to support artists through licensing and copyright. A policymaker might also implement more data-driven strategies to support budding musicians by analyzing how people react to certain tracks."),
           tags$h3("There may be some challenges and limits with the dataset. One of them is the accuracy of the data extracted from the dataset. Any minute mistakes or omissions in recording the song's timing, or a lack of information on when it was released. Another worry is the ethical considerations around the data. We don't know if the information was given with consent or if there were any privacy or representation issues. 
Another problem is that this dataset is based on a specific timeframe, and we must match the dataset's insight to the study questions based on that timeframe. We can't apply the same findings to current music trends because they're so dynamic. The music industry undergoes numerous changes that are difficult to predict using the data we have. We'll need more recent data to do this. We also don't know how the dataset rubrics were calculated. 
For example, the popularity of songs we know is graded from 0 to 100, but we don't know how the figures were computed. These are some challenges and limitations we will have to address with our project.")
        )
    )
)
tabPanel(
  "First Chart",
  fluidPage(
    titlePanel("Song Danceability Vs Energy"),
    sidebarLayout(
      sidebarPanel(
        tags$h3("The graph helps identify the relationship between the two variables: Energy and Danceability. It helps us visualize the common perception that higher energy songs are like to have high danceability. Since both the variable are numbers using a scatter plot also helps understand the relationship much better. We see from the graph that there seems to be a positive relationship between the two variables. Though we see a lot of data crowded between 0.25-0.75 of the dancebility we can assume they fall in the normal bell shaped curves. We may conclude that most of the songs have a good energy hence resulting in danceability. But we may also say that due to the song having high danceability people assume it to have high energy. Hence, we know they share a positive relationship but we cannot assume one cause the other since there are several factors that contribute into this relationship."),
        mainPanel(
          plotOutput("firstchart"),
          sliderInput("danceability",
                      "Danceability:",
                      min= 0,
                      max = 1,
                      value = 2),
          sliderInput("energy",
                      "Energy:",
                      min = 0,
                      max = 1,
                      value = 2)
        )
      )
    )
  )
)