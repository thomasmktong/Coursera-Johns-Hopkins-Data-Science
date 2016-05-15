## ui.R
shinyUI(pageWithSidebar(
        headerPanel("Hong Kong Stock Market Sentiment Heatmap"),
        sidebarPanel(
                paste("How to use: Choose a dataset to view the heatmap.",
                      "In the map, you can see boxes in different sizes,",
                      "higher priced stocks have larger boxes.",
                      "For stocks that prices rised in last business day,",
                      "the corresponding boxes are colored as green,",
                      "otherwise in red."),
                br(),
                br(),
                paste("Note: View in full screen.",
                      "Don't use shiny's preview, use a browser.",
                      "Data takes a long time to download."),
                br(),
                br(),
                selectInput("dataset", "Choose a dataset:",
                            choices = c("Main Board Equity Securities",
                                        "Growth Enterprise Market", 
                                        "Investment Companies", 
                                        "Exchange Traded Funds",
                                        "Real Estate Investment Trusts"))
        ),
        mainPanel(
                htmlOutput("view")
        )
)) 