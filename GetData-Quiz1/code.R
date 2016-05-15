setwd('C:/Users/Thomas/Documents/GitHub/GetData_Quiz1')

### Q1

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile='q1.csv')
q1Data <- read.table('q1.csv', header=true, sep=',')
sum(as.integer(q1Data$VAL==24), na.rm=TRUE)

### Q3

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileUrl, destfile='q3.xlsx')

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
library("xlsx", lib.loc="C:/Program Files/R/R-3.1.1/library")
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx('q3.xlsx', sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

### Q4

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(fileUrl, destfile='q4.xml')

library("XML", lib.loc="C:/Program Files/R/R-3.1.1/library")
doc <- xmlTreeParse('q4.xml', useInternal=TRUE)
rootNode <- xmlRoot(doc)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(as.integer(zip=="21231"), na.rm=TRUE)

### Q5

library("data.table", lib.loc="C:/Program Files/R/R-3.1.1/library")
DT <- fread('q1.csv', sep="auto", sep2="auto", nrows=-1L, header="auto", na.strings="NA",
      stringsAsFactors=FALSE, verbose=getOption("datatable.verbose"), autostart=30L,
      skip=-1L, select=NULL, drop=NULL, colClasses=NULL,
      integer64=getOption("datatable.integer64"),         # default: "integer64"
      showProgress=getOption("datatable.showProgress"),   # default: TRUE
      data.table=getOption("datatable.fread.datatable")   # default: TRUE
)