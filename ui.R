library(shiny)

# Define UI for application that predicts diamond price using carat information
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Estimating Diamond Prices"),
  
  p("Use this application to estimate the cost of a diamond for a given ", em("carat"), " value."),
  p("Please enter your desired value in the text box shown below. The price estimate will be displayed on the right."),
  
  # Sidebar with a numeric input for carat value
  sidebarLayout(
    sidebarPanel(
       numericInput(inputId="ct",label="carat value:",value=0.23,min=0.01,max=10000,step = 0.002)
    ),
    
    # Show the estimated price of this diamond
    mainPanel(
      p("Estimated diamond value is ", strong(textOutput("p",inline = TRUE)), " USD,"),
      plotOutput("plot")
    )
  ),
  
  p("[The R code used for this application can be found ", 
    a("here",href="https://github.com/fjelltronen/DiamondPriceEstimationsShinyApp"), ".]")
))
