#devtools::install_github("timelyportfolio/explodingboxplotR@feature/crosstalk")

library(explodingboxplotR)
library(shiny)
library(beeswarm)

ui <- fluidPage(
  fluidRow(
    column(
      width = 6,
      exploding_boxplotOutput("explode1", height = 400)
    ),
    column(
      width = 6,
      plotOutput("beeswarm1", height = 400)
    )
  ),
  fluidRow(
    plotOutput("distplot1", height = 400)
  )
)

server <- function(input,output,session){
  output$explode1 <- renderExploding_boxplot({
    exploding_boxplot(
      data.frame(
        rowname = rownames(InsectSprays),
        InsectSprays,
        stringsAsFactors = FALSE
      ),
      y = "count",
      group = "spray",
      color = "spray",
      label = "rowname",
      crosstalk_group = "A"
    )
  })
  
  sd <- crosstalk::SharedData$new(InsectSprays, "spray", group = "A")
  
  output$beeswarm1 <- renderPlot({
    df <- sd$data(TRUE)
    if(any(is.na(df$selected_))) {
      beeswarm(count~spray,df)
    } else {
      beeswarm(count~spray,subset(df, df$selected_ == TRUE))
    }
  })
  
  output$distplot1 <- renderPlot({
    df <- sd$data(TRUE)
    if(any(is.na(df$selected_))) {
      plot(density(df$count))
    } else {
      plot(
        density(subset(df, df$selected_ == TRUE)$count),
        xlim = c(0,max(df$count))
      )
    }
  })
}

shinyApp(ui,server)