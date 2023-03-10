# Define the sidebar menu items
sidebar <- dashboardSidebar(
  color = "green",
  sidebarMenu(
    menuItem("Home", tabName = "home", icon = icon("home")),
    menuItem("Tabulate Species", tabName = "table", icon = icon("table")),
    menuItem("Visualize Species", tabName = "map", icon = icon("map"))
  )
)

# Display content of each menu item on the body
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "home",
            tags$h4("Welcome to Poland Biodiversity"),
            tags$p("This dashboard app allows you to visualize the selected Poland species on the map and how often they are observed. 
              You can view the species listed on the table by clicking on \"Tabulate Species\" on the side bar menu. To visualize the 
              species on the map, click \"Visualize Species\" on the side bar menu. You will then be able to search for species by thier 
              vernacular name or scientific name for the app to display thier observations on the map. You should be able to view 
              a visualization of a timeline when selected species were observed")
    ),
    
    tabItem(tabName = "table",
            tags$h3("Poland Species"),
            dataTableOutput("speciesTable")
    ),
    
    tabItem(tabName = "map",
            tags$h3("Visualization of Poland species"),
            fluidRow(
              box(
                title = "Inputs", status = "success",
                #uiOutput("select_species")
                withSpinner(uiOutput("select_species"), type = 5, color = "green", size = 1)
              )
            ),
            
            fluidRow(
              box(
                title = "Visualization of selected species on the map", status = "success",
                withSpinner(leafletOutput(outputId = "leafletMap"), type = 1, color = "green", size = 1)
                ),
              box(
                title = "Timeline of when selected species were observed", status = "success",
                withSpinner(plotlyOutput("timeline"), type = 8, color = "green", size = 1)
                )
            )
    )
  )
)

ui <- dashboardPage(title = "Poland Biodiversity",
  dashboardHeader(title = tags$b("Poland Biodiversity")),
  sidebar,
  body
)