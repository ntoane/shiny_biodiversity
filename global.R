# Load packages 
library(shiny)
library(shinydashboard)

# Read Poland biodiversity data
data <- read.csv("./data/poland_data.csv", header=TRUE, stringsAsFactors=FALSE)