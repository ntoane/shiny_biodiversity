server <- function(input, output, session) {
  # Get the data
  table_data <- reactive({
    # Use few columns for table
    columns <- c('locality', 'scientificName', 'vernacularName', 'sex', 'kingdom', 'family', 'higherClassification', 'longitudeDecimal', 'latitudeDecimal')
    table_data <- data[, columns]
  })
  
  # Render the table data
  output$speciesTable = DT::renderDataTable({
    DT::datatable(table_data())
  })
}