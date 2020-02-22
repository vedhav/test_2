library(shiny)
library(reticulate)
source_python("helper.py")

ui <- fluidPage(
  numericInput("input_id", "Enter a number", 0),
  actionButton("button_id", "Click me"),
  textOutput("text_out")
)

server <- function(input, output, session) {
  observeEvent(input$button_id, {
    output$text_out <- renderText({
      paste0(isolate(input$input_id), " multiplied by 20 is ", py_function(isolate(input$input_id)))
    })
  })
}

shinyApp(ui, server)