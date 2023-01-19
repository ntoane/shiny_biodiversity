# Define the sidebar menu items
sidebar <- dashboardSidebar(
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
            tags$p("This dashboard app allows you to visualize the selected Poland species on the map and how often it is observed. 
              You can view the species listed on the table by clicking on \"Tabulate Species\" on the side bar menu. To visualize the 
              species on the map, click \"Visualize Species\" on the side bar menu. You will then be able to search for species by thier 
              vernacular nane and scientific name for the app to display observations on the map. You should be able to view 
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
                uiOutput("select_species")
              )
            ),
            
            fluidRow(
              box(
                title = "Visualization of selected species on the map", status = "success",
                leafletOutput(outputId = "leafletMap")
                ),
              box(
                title = "Histogram of selected species", status = "success",
                plotOutput("histogram")
                )
            )
    )
  )
)

ui <- dashboardPage(skin = "green", title = "Appsilon | Poland Biodiversity",
  dashboardHeader(title = tags$b("Poland Biodiversity")),
  sidebar,
  body
)