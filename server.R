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

  # Get whole data
  get_data <- reactive({
    get_data <- data
  })
  
  # Render UI for selecting Scientific or Vernacular name
  output$select_species <- renderUI(
    selectizeInput(inputId = "species_name", 
               label = "Select Scientific or Vernacular Name",
               selected = c("Alces alces", "Silene viscaria"),
               choices = c(get_data()["scientificName"], get_data()["vernacularName"]),
               multiple = TRUE
    )
    
  )
  
  # Filter the data by scientificName or vernacularName
  filter_data <- eventReactive(input$species_name, {
    validate(
      need(input$species_name, "Please select Vernacular name or Scientific name to visualize them on the map here")
    )
    
    filter_data <- dplyr::filter(get_data(),get_data()$scientificName %in% input$species_name | 
                                   get_data()$vernacularName %in% input$species_name)
  }, ignoreNULL = FALSE)
  
  # Visualization of species on the map
  output$leafletMap <- renderLeaflet({
    #input_data
    filter_data <- filter_data()
  
    # Leaflet popup features
    filter_data$popup_features <- with(filter_data, paste(
      "<p> <b>Vernacular name:</b>", vernacularName, " </br>",
      "<b>Scientific name:</b>", scientificName, "</br>",
      "<b>Kingdom:</b>", kingdom, "</br>",
      "<b>Family:</b>", family, "</br>",
      "<b>Sex:</b>", sex, "</br>",
      "<b>Locality:</b>", locality, "</br>",
      "<b>Event Date:</b>", eventDate, "</br>",
      "<b>Event Time:</b>", eventTime, "</br>",
      "</p>"))
    
    leaflet(filter_data) %>%
     addTiles() %>%
    addMarkers(lat = filter_data$latitudeDecimal, 
               lng = filter_data$longitudeDecimal,
               popup = filter_data$popup_features)
  })
}