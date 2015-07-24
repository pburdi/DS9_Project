# server.R

library(maps)
library(mapproj)
states <- readRDS("data/counties_mod.rds")
source("helpers.R")

shinyServer(
   function(input, output) {
      output$map <- renderPlot({
         data <- switch(input$var, 
                        "2012" = states$P2012,
                        "2013" = states$P2013,
                        "2014" = states$P2014)
         
         color <- switch(input$var, 
                         "2012" = "darkgreen",
                         "2013" = "darkorange",
                         "2014" = "darkviolet")
                         
         
         legend <- switch(input$var, 
                          "2012" = "2012",
                          "2013" = "2013",
                          "2014" = "2014")
         
         percent_map(var = data, 
                     color = color, 
                     legend.title = legend, 
                     max = input$range[2], 
                     min = input$range[1])
      })
   }
)