# Load packages 
library(shiny)
# library(shinydashboard)
library(DT)
library(leaflet)
library(dplyr)
library(plotly)
library(shinytest2)
library(semantic.dashboard)
library(shinycssloaders)

# Read Poland biodiversity data
data <- read.csv("./data/poland_data.csv", header=TRUE, stringsAsFactors=FALSE)