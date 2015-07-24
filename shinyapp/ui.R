shinyUI(fluidPage(
   titlePanel("2012-2014 Nation Wide NICS Checks for Gun Purchases/Explosives"),
   
   sidebarLayout(
      sidebarPanel(
         helpText("By State, Expressed as % of Population. Please select the year and the range of interest"),
         
         selectInput("var", 
                     label = "Choose a Year to display for NICS Background Checks ",
                     choices = c("2012", "2013",
                                 "2014"),
                     selected = "2012"),
         
         sliderInput("range", 
                     label = "Range of interest (determines % of Population to focus on):",
                     min = 0, max = 15, value = c(0, 15))
      ),
      
      mainPanel(plotOutput("map"))
   )
))