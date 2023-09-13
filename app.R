library(bs4Dash)
library(ggplot2)
library(tidyverse)
shinyApp(
  ui = dashboardPage(
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    body = dashboardBody(
      tabBox(
        id = "tabset1",
        height = 750,
        #width = 12,
        tabPanel("Hello", "This is the hello tab",
                 div(style = 'overflow-x: scroll', DT::dataTableOutput('myTable'))
        ))
    )
  ),
  server = function(input, output, session) {
    output$myTable <- DT::renderDT({
      DT::datatable(
        mtcars) 
    })
  }
)
