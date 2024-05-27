#ShinyApps Connect

install.packages('rsconnnect')
rsconnect::setAccountInfo(name='info201-final-rvardar', token='EC15723E2B62A82F7BA9447DBF5F6822', secret='43iJ11MkEKpYJKpkljNzyrIGjdXa04fZsNNKlXrr')
library(rsconnect)+
  rsconnect::deployApp('https://info201-final-rvardar.shinyapps.io/final-project-spotify-music')