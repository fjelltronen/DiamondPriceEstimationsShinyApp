library(shiny)

# Define server logic based on a linear regression model on the diamond dataset
shinyServer(function(input, output) {
  # linear model 
  fit <- lm(price~I(carat * 10), data = diamond)
  # plot to display known carat/price values; the fit; and new value
  output$plot <- renderPlot({
    ggplot(data = diamond, aes(x = carat, y = price)) + 
      labs(title = "Known (carat,price) values", subtitle = "Orange dot marks entered value",
           x = "Carat (diamond size)", y = "Price (SIN $)") + 
      geom_point(color = "seagreen", size = 3, alpha = 0.5) +
      geom_smooth(method = "lm", formula = y~x, se = FALSE, color = "lightseagreen", alpha = 0.3) +
      geom_point(aes(x = as.numeric(input$ct), y = round(predict(fit, data.frame(carat = as.numeric(input$ct))))),
                 color = "orange", size = 5) + 
      geom_text(data = data.frame(carat = as.numeric(input$ct), price = round(predict(fit, data.frame(carat = as.numeric(input$ct))))),
                aes(x = carat, y = price, label = paste(sep = "", "(", carat, ", ", price," SIN$)"), ''),
                hjust = 0, vjust = 0)
    })
  output$p <- renderText({
    round(predict(fit,newdata=data.frame(carat=as.numeric(input$ct))),2)
    })
})
