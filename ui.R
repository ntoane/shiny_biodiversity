# Define the sidebar menu items
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Home", tabName = "home", icon = icon("home")),
    menuItem("Species on Table", tabName = "table", icon = icon("table")),
    menuItem("Species on Map", tabName = "map", icon = icon("map-marker"))
  )
)

# Display content of each menu item on the body
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "home",
            h4("Welcome to Poland Biodiversity"),
            p("This dashboard app allows you to visualize the selected Poland species on the map and how often it is observed. 
              You can view the species listed on the table by clicking on \"Species on Table\" on the side bar menu. To visualize the 
              species on the map, click \"Species on Map\" on the side bar menu. You will then be able to search for species by thier 
              vernacular nane and scientific name for the app to display observations on the map. You should be able to view 
              a visualization of a timeline when selected species were observed")
    ),
    
    tabItem(tabName = "table",
            h3("Poland Species"),
            DT::dataTableOutput(outputId = "speciesTable")
    ),
    
    tabItem(tabName = "map",
            h3("Map works")
    )
  )
)

ui <- dashboardPage(skin = "green", title = "Appsilon | Poland Biodiversity",
  dashboardHeader(title = tags$b("Poland Biodiversity")),
  sidebar,
  body
)