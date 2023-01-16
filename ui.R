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
            h3("Dashboard works")
    ),
    
    tabItem(tabName = "table",
            h3("Table works")
    ),
    
    tabItem(tabName = "map",
            h3("Map works")
    )
  )
)

ui <- dashboardPage(skin = "green",
  dashboardHeader(title = tags$b("Poland Biodiversity")),
  sidebar,
  body
)