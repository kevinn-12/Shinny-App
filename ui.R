library(shiny); library(plotly)

CBS <- read.csv("CBS.csv")


shinyUI(fluidPage(

    # Application title
    titlePanel("Cross-Border Claims"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("Reporting Country",
                        "Reporting Country:",
                        choices = unique(CBS$Reporting.country)),
            selectInput("Counterparty Country",
                        "Counterparty Country:",
                        choices = unique(CBS$Counterparty.country))
            ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("Plot")
        )
    )
))
