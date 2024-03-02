library(shiny)

ui <- fluidPage(
  
  titlePanel("Hello World!"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "text_input", label = "Input text here:")
    ),
    
    mainPanel(
      textOutput(outputId = "text_output"),
      textOutput(outputId = "text_output2")
    )
  )
)

server <- function(input, output) {
  
  text <- reactive({
    paste("You typed:", input$text_input)
  })
  
  output$text_output <- renderText({
    text()
  })
  
  output$text_output2 <- renderText({
    paste(text(), "5")
  })
  
}

shinyApp(ui = ui, server = server)
