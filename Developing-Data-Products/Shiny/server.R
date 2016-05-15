## server.R
## Thomas Tong
## Note: data preload runs very very long!!

library(XML)
library(quantmod)
library(googleVis)
library(shiny)

downloadSummary <- function(hkexPage, title) {
        theurl <- paste("http://www.hkex.com.hk/eng/market/sec_tradinfo/stockcode/", hkexPage, ".htm", sep="")
        cat(theurl)
        tables <- readHTMLTable(theurl, as.data.frame = F)
        
        tickers <- tables[[length(tables)]][1]
        rm(tables)
        
        tickers <- lapply(tickers, as.numeric)
        tickers <- lapply(tickers, formatC, width=4, format="d", flag="0")
        tickers <- lapply(tickers, paste, ".HK", sep="")
        tickers <- unlist(tickers)
        
        validTickers <- title
        parent <- validTickers
        parents <- NA
        last <- 0
        chg <- 0
        
        for(ticker in tickers) {
                tryCatch({
                        tmp <- getSymbols(ticker,src="yahoo", auto.assign=F)
                        last <- c(last, as.numeric(last(tmp, '1 day')[, paste(ticker, "Adjusted", sep=".")]))
                        chg <- c(chg, as.numeric(last(Delt(tmp[, paste(ticker, "Adjusted", sep=".")]), '1 day')) * 100)
                        validTickers <- c(validTickers, ticker)
                        parents <- c(parents, parent)
                }, error=function(e){cat("ERROR :",conditionMessage(e), "\n")})
        }
        
        summary <- data.frame(validTickers, parents, last, chg, stringsAsFactors=F)
        rm(tmp)
        rm(last)
        rm(chg)
        rm(tickers)
        rm(validTickers)
        return(summary)
}

eisdeqty <- downloadSummary("eisdeqty", "Main Board: Equity Securities")
eisdic <- downloadSummary("eisdic", "Main Board: Investment Companies")
eisdetf <- downloadSummary("eisdetf", "Main Board: Exchange Traded Funds")
eisdreit <- downloadSummary("eisdreit", "Main Board: Real Estate Investment Trusts")
eisdgems <- downloadSummary("eisdgems", "Growth Enterprise Market: Equity Securities")

shinyServer(function(input, output) {
        datasetInput <- reactive({
                switch(input$dataset,
                       "Main Board Equity Securities" = eisdeqty,
                       "Investment Companies" = eisdic,
                       "Exchange Traded Funds" = eisdetf,
                       "Real Estate Investment Trusts" = eisdreit,
                       "Growth Enterprise Market" = eisdgems)
        })
        output$view <- renderGvis({
                gvisTreeMap(datasetInput(), idvar="validTickers", parentvar="parents", sizevar="last", colorvar="chg",
                            options = list(width="100%", height="580px", showScale=TRUE, 
                                           minColorValue=-5, maxColorValue=+5))
        })
}) 