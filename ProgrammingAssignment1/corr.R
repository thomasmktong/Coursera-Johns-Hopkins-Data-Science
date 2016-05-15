corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        id <- 1:332
        correl <- numeric()
        
        for(i in id) {
                t <- read.csv(sprintf("%s/%03d.csv", directory, i))
                fltr <- t[!is.na(t$sulfate) & !is.na(t$nitrate),]
                if(nrow(fltr) > threshold) {
                        correl <- c(correl, cor(fltr$sulfate, fltr$nitrate))
                }
        }
        correl
}