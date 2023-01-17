server <- function(input, output, session) {
  # Get the data
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
  
  # Render Histogram data
  output$histogram <- renderPlot({
    hist(faithful$eruptions)
  })
  
  usaLat <- 36.5588659
  usaLon <- -107.6660877
  usaZoom <- 3
  
  map_data <- reactive({
    data %>%
      filter(scientificName %in% input$inputSpecies) %>%
      mutate(INFO = paste0(scientificName, ", ", vernacularName))
  })
  
  # Render leaflet map
  #output$leafletMap <- renderLeaflet({
   # leaflet(data = map_data()) %>%
    #  setView(lat = usaLat, lng = usaLon, zoom = usaZoom) %>%
     # addTiles() %>%
      #addMarkers(~longitudeDecimal, ~latitudeDecimal, popup = ~INFO, label = ~INFO) %>%
      #addProviderTiles(providers$Esri.WorldStreetMap)
  #})
}