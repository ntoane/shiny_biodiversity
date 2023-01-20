library(shinytest2)

test_that("{shinytest2} recording: shiny_biodiversity", {
  app <- AppDriver$new(name = "shiny_biodiversity", height = 763, width = 1235)
  app$expect_values()
  app$set_inputs(species_name = "Alces alces")
  app$set_inputs(species_name = character(0))
  app$set_inputs(species_name = "Grus grus")
  app$set_inputs(species_name = c("Grus grus", "Lacerta agilis"))
  app$set_inputs(species_name = c("Grus grus", "Lacerta agilis", "Nuphar lutea"))
})
