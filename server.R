server <- function(input, output, session) {
  # Get the table data
  table_data <- reactive({
    # Use few columns for table
    columns <- c('locality', 'scientificName', 'vernacularName', 'sex', 'kingdom', 'family', 'higherClassification', 'longitudeDecimal', 'latitudeDecimal')
    table_data <- data[, columns]
  })
  
  # Render the table data
  output$speciesTable <- renderDataTable({
    datatable(table_data())
  })
  
  # Visualization on map
  # Get data
  get_data <- reactive({
    get_data <- data
  })
  
  # Render UI for selecting Scientific or Vernacular name
  output$select_species <- renderUI(
    selectizeInput(inputId = "species_name", 
               label = "Select Scientific or Vernacular Name",
               selected = c("Alces alces", "Cygnus olor"),
               choices = c(get_data()["scientificName"], get_data()["vernacularName"]),
               multiple = TRUE
    )
    
  )
}