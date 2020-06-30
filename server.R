library(shiny); library(plotly)

CBS <- read.csv("CBS.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    dat <- reactive({
        a <- subset(CBS, Reporting.country == input$`Reporting Country` & Counterparty.country == input$`Counterparty Country`)
        return(a)
    })

    output$Plot <- renderPlotly({
        fig <- plot_ly(dat(), x = ~year, y = ~international_claims, type = 'scatter', 
                mode = 'lines', name = ~Reporting.country)
        fig %>% layout(title = "Cross-Border Claims: Reporting Country vis-a-vis Counterparty Country",
                       xaxis = list(title = 'Year'), yaxis = list (title = 'International Claims'), 
                       annotations = list(text = 'Source: BIS: Consolidated Banking Statistics', x = 1, y = -0.1,
                                          showarrow = F, xref='paper', yref='paper', 
                                          xanchor='right', yanchor='auto', xshift=0, yshift=0))
    

    })

})
