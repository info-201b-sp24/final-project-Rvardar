#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
install.packages('rsconnnect')
rsconnect::setAccountInfo(name='info201-final-rvardar', token='EC15723E2B62A82F7BA9447DBF5F6822', secret='43iJ11MkEKpYJKpkljNzyrIGjdXa04fZsNNKlXrr')
library(rsconnect)+
  rsconnect::deployApp('https://info201-final-rvardar.shinyapps.io/final-project-spotify-music')
library(shiny)
library(tidyverse)
library(ggplot)
library(stringr)


# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')

    })

}
