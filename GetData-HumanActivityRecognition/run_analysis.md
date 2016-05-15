# run_analysis.R

Prep: Load lib, set working directory, download dataset & unzip


```r
library("dplyr", lib.loc="C:/Program Files/R/R-3.1.1/library")
```

```
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library("tidyr", lib.loc="C:/Program Files/R/R-3.1.1/library")

setwd('C:/Users/Thomas/Documents/GitHub/GetData_HumanActivityRecognition')
data_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(data_url, destfile='Dataset.zip')
unzip('Dataset.zip')
```

1- Merges the training and the test sets to create one data set


```r
x_train_path <- 'UCI HAR Dataset/train/X_train.txt'
y_train_path <- 'UCI HAR Dataset/train/y_train.txt'
x_test_path <- 'UCI HAR Dataset/test/X_test.txt'
y_test_path <- 'UCI HAR Dataset/test/y_test.txt'

x_train_tbl <- tbl_dt(read.table(x_train_path))
```

```
## Loading required namespace: data.table
```

```r
y_train_tbl <- tbl_dt(read.table(y_train_path))
x_train_tbl <- mutate(x_train_tbl, activity = y_train_tbl$V1)

x_test_tbl <- tbl_dt(read.table(x_test_path))
y_test_tbl <- tbl_dt(read.table(y_test_path))
x_test_tbl <- mutate(x_test_tbl, activity = y_test_tbl$V1)

tbl <- rbind_list(x_train_tbl, x_test_tbl)
rm(list = ls()[grepl("(train|test)", ls())])

tbl
```

```
## Source: local data frame [10,299 x 562]
## 
##           V1           V2         V3         V4         V5         V6
## 1  0.2885845 -0.020294171 -0.1329051 -0.9952786 -0.9831106 -0.9135264
## 2  0.2784188 -0.016410568 -0.1235202 -0.9982453 -0.9753002 -0.9603220
## 3  0.2796531 -0.019467156 -0.1134617 -0.9953796 -0.9671870 -0.9789440
## 4  0.2791739 -0.026200646 -0.1232826 -0.9960915 -0.9834027 -0.9906751
## 5  0.2766288 -0.016569655 -0.1153619 -0.9981386 -0.9808173 -0.9904816
## 6  0.2771988 -0.010097850 -0.1051373 -0.9973350 -0.9904868 -0.9954200
## 7  0.2794539 -0.019640776 -0.1100221 -0.9969210 -0.9671859 -0.9831178
## 8  0.2774325 -0.030488303 -0.1253604 -0.9965593 -0.9667284 -0.9815853
## 9  0.2772934 -0.021750698 -0.1207508 -0.9973285 -0.9612453 -0.9836716
## 10 0.2805857 -0.009960298 -0.1060652 -0.9948034 -0.9727584 -0.9862439
## ..       ...          ...        ...        ...        ...        ...
## Variables not shown: V7 (dbl), V8 (dbl), V9 (dbl), V10 (dbl), V11 (dbl),
##   V12 (dbl), V13 (dbl), V14 (dbl), V15 (dbl), V16 (dbl), V17 (dbl), V18
##   (dbl), V19 (dbl), V20 (dbl), V21 (dbl), V22 (dbl), V23 (dbl), V24 (dbl),
##   V25 (dbl), V26 (dbl), V27 (dbl), V28 (dbl), V29 (dbl), V30 (dbl), V31
##   (dbl), V32 (dbl), V33 (dbl), V34 (dbl), V35 (dbl), V36 (dbl), V37 (dbl),
##   V38 (dbl), V39 (dbl), V40 (dbl), V41 (dbl), V42 (dbl), V43 (dbl), V44
##   (dbl), V45 (dbl), V46 (dbl), V47 (dbl), V48 (dbl), V49 (dbl), V50 (dbl),
##   V51 (dbl), V52 (dbl), V53 (dbl), V54 (dbl), V55 (dbl), V56 (dbl), V57
##   (dbl), V58 (dbl), V59 (dbl), V60 (dbl), V61 (dbl), V62 (dbl), V63 (dbl),
##   V64 (dbl), V65 (dbl), V66 (dbl), V67 (dbl), V68 (dbl), V69 (dbl), V70
##   (dbl), V71 (dbl), V72 (dbl), V73 (dbl), V74 (dbl), V75 (dbl), V76 (dbl),
##   V77 (dbl), V78 (dbl), V79 (dbl), V80 (dbl), V81 (dbl), V82 (dbl), V83
##   (dbl), V84 (dbl), V85 (dbl), V86 (dbl), V87 (dbl), V88 (dbl), V89 (dbl),
##   V90 (dbl), V91 (dbl), V92 (dbl), V93 (dbl), V94 (dbl), V95 (dbl), V96
##   (dbl), V97 (dbl), V98 (dbl), V99 (dbl), V100 (dbl), V101 (dbl), V102
##   (dbl), V103 (dbl), V104 (dbl), V105 (dbl), V106 (dbl), V107 (dbl), V108
##   (dbl), V109 (dbl), V110 (dbl), V111 (dbl), V112 (dbl), V113 (dbl), V114
##   (dbl), V115 (dbl), V116 (dbl), V117 (dbl), V118 (dbl), V119 (dbl), V120
##   (dbl), V121 (dbl), V122 (dbl), V123 (dbl), V124 (dbl), V125 (dbl), V126
##   (dbl), V127 (dbl), V128 (dbl), V129 (dbl), V130 (dbl), V131 (dbl), V132
##   (dbl), V133 (dbl), V134 (dbl), V135 (dbl), V136 (dbl), V137 (dbl), V138
##   (dbl), V139 (dbl), V140 (dbl), V141 (dbl), V142 (dbl), V143 (dbl), V144
##   (dbl), V145 (dbl), V146 (dbl), V147 (dbl), V148 (dbl), V149 (dbl), V150
##   (dbl), V151 (dbl), V152 (dbl), V153 (dbl), V154 (dbl), V155 (dbl), V156
##   (dbl), V157 (dbl), V158 (dbl), V159 (dbl), V160 (dbl), V161 (dbl), V162
##   (dbl), V163 (dbl), V164 (dbl), V165 (dbl), V166 (dbl), V167 (dbl), V168
##   (dbl), V169 (dbl), V170 (dbl), V171 (dbl), V172 (dbl), V173 (dbl), V174
##   (dbl), V175 (dbl), V176 (dbl), V177 (dbl), V178 (dbl), V179 (dbl), V180
##   (dbl), V181 (dbl), V182 (dbl), V183 (dbl), V184 (dbl), V185 (dbl), V186
##   (dbl), V187 (dbl), V188 (dbl), V189 (dbl), V190 (dbl), V191 (dbl), V192
##   (dbl), V193 (dbl), V194 (dbl), V195 (dbl), V196 (dbl), V197 (dbl), V198
##   (dbl), V199 (dbl), V200 (dbl), V201 (dbl), V202 (dbl), V203 (dbl), V204
##   (dbl), V205 (dbl), V206 (dbl), V207 (dbl), V208 (dbl), V209 (dbl), V210
##   (dbl), V211 (dbl), V212 (dbl), V213 (dbl), V214 (dbl), V215 (dbl), V216
##   (dbl), V217 (dbl), V218 (dbl), V219 (dbl), V220 (dbl), V221 (dbl), V222
##   (dbl), V223 (dbl), V224 (dbl), V225 (dbl), V226 (dbl), V227 (dbl), V228
##   (dbl), V229 (dbl), V230 (dbl), V231 (dbl), V232 (dbl), V233 (dbl), V234
##   (dbl), V235 (dbl), V236 (dbl), V237 (dbl), V238 (dbl), V239 (dbl), V240
##   (dbl), V241 (dbl), V242 (dbl), V243 (dbl), V244 (dbl), V245 (dbl), V246
##   (dbl), V247 (dbl), V248 (dbl), V249 (dbl), V250 (dbl), V251 (dbl), V252
##   (dbl), V253 (dbl), V254 (dbl), V255 (dbl), V256 (dbl), V257 (dbl), V258
##   (dbl), V259 (dbl), V260 (dbl), V261 (dbl), V262 (dbl), V263 (dbl), V264
##   (dbl), V265 (dbl), V266 (dbl), V267 (dbl), V268 (dbl), V269 (dbl), V270
##   (dbl), V271 (dbl), V272 (dbl), V273 (dbl), V274 (dbl), V275 (dbl), V276
##   (dbl), V277 (dbl), V278 (dbl), V279 (dbl), V280 (dbl), V281 (dbl), V282
##   (dbl), V283 (dbl), V284 (dbl), V285 (dbl), V286 (dbl), V287 (dbl), V288
##   (dbl), V289 (dbl), V290 (dbl), V291 (dbl), V292 (dbl), V293 (dbl), V294
##   (dbl), V295 (dbl), V296 (dbl), V297 (dbl), V298 (dbl), V299 (dbl), V300
##   (dbl), V301 (dbl), V302 (dbl), V303 (dbl), V304 (dbl), V305 (dbl), V306
##   (dbl), V307 (dbl), V308 (dbl), V309 (dbl), V310 (dbl), V311 (dbl), V312
##   (dbl), V313 (dbl), V314 (dbl), V315 (dbl), V316 (dbl), V317 (dbl), V318
##   (dbl), V319 (dbl), V320 (dbl), V321 (dbl), V322 (dbl), V323 (dbl), V324
##   (dbl), V325 (dbl), V326 (dbl), V327 (dbl), V328 (dbl), V329 (dbl), V330
##   (dbl), V331 (dbl), V332 (dbl), V333 (dbl), V334 (dbl), V335 (dbl), V336
##   (dbl), V337 (dbl), V338 (dbl), V339 (dbl), V340 (dbl), V341 (dbl), V342
##   (dbl), V343 (dbl), V344 (dbl), V345 (dbl), V346 (dbl), V347 (dbl), V348
##   (dbl), V349 (dbl), V350 (dbl), V351 (dbl), V352 (dbl), V353 (dbl), V354
##   (dbl), V355 (dbl), V356 (dbl), V357 (dbl), V358 (dbl), V359 (dbl), V360
##   (dbl), V361 (dbl), V362 (dbl), V363 (dbl), V364 (dbl), V365 (dbl), V366
##   (dbl), V367 (dbl), V368 (dbl), V369 (dbl), V370 (dbl), V371 (dbl), V372
##   (dbl), V373 (dbl), V374 (dbl), V375 (dbl), V376 (dbl), V377 (dbl), V378
##   (dbl), V379 (dbl), V380 (dbl), V381 (dbl), V382 (dbl), V383 (dbl), V384
##   (dbl), V385 (dbl), V386 (dbl), V387 (dbl), V388 (dbl), V389 (dbl), V390
##   (dbl), V391 (dbl), V392 (dbl), V393 (dbl), V394 (dbl), V395 (dbl), V396
##   (dbl), V397 (dbl), V398 (dbl), V399 (dbl), V400 (dbl), V401 (dbl), V402
##   (dbl), V403 (dbl), V404 (dbl), V405 (dbl), V406 (dbl), V407 (dbl), V408
##   (dbl), V409 (dbl), V410 (dbl), V411 (dbl), V412 (dbl), V413 (dbl), V414
##   (dbl), V415 (dbl), V416 (dbl), V417 (dbl), V418 (dbl), V419 (dbl), V420
##   (dbl), V421 (dbl), V422 (dbl), V423 (dbl), V424 (dbl), V425 (dbl), V426
##   (dbl), V427 (dbl), V428 (dbl), V429 (dbl), V430 (dbl), V431 (dbl), V432
##   (dbl), V433 (dbl), V434 (dbl), V435 (dbl), V436 (dbl), V437 (dbl), V438
##   (dbl), V439 (dbl), V440 (dbl), V441 (dbl), V442 (dbl), V443 (dbl), V444
##   (dbl), V445 (dbl), V446 (dbl), V447 (dbl), V448 (dbl), V449 (dbl), V450
##   (dbl), V451 (dbl), V452 (dbl), V453 (dbl), V454 (dbl), V455 (dbl), V456
##   (dbl), V457 (dbl), V458 (dbl), V459 (dbl), V460 (dbl), V461 (dbl), V462
##   (dbl), V463 (dbl), V464 (dbl), V465 (dbl), V466 (dbl), V467 (dbl), V468
##   (dbl), V469 (dbl), V470 (dbl), V471 (dbl), V472 (dbl), V473 (dbl), V474
##   (dbl), V475 (dbl), V476 (dbl), V477 (dbl), V478 (dbl), V479 (dbl), V480
##   (dbl), V481 (dbl), V482 (dbl), V483 (dbl), V484 (dbl), V485 (dbl), V486
##   (dbl), V487 (dbl), V488 (dbl), V489 (dbl), V490 (dbl), V491 (dbl), V492
##   (dbl), V493 (dbl), V494 (dbl), V495 (dbl), V496 (dbl), V497 (dbl), V498
##   (dbl), V499 (dbl), V500 (dbl), V501 (dbl), V502 (dbl), V503 (dbl), V504
##   (dbl), V505 (dbl), V506 (dbl), V507 (dbl), V508 (dbl), V509 (dbl), V510
##   (dbl), V511 (dbl), V512 (dbl), V513 (dbl), V514 (dbl), V515 (dbl), V516
##   (dbl), V517 (dbl), V518 (dbl), V519 (dbl), V520 (dbl), V521 (dbl), V522
##   (dbl), V523 (dbl), V524 (dbl), V525 (dbl), V526 (dbl), V527 (dbl), V528
##   (dbl), V529 (dbl), V530 (dbl), V531 (dbl), V532 (dbl), V533 (dbl), V534
##   (dbl), V535 (dbl), V536 (dbl), V537 (dbl), V538 (dbl), V539 (dbl), V540
##   (dbl), V541 (dbl), V542 (dbl), V543 (dbl), V544 (dbl), V545 (dbl), V546
##   (dbl), V547 (dbl), V548 (dbl), V549 (dbl), V550 (dbl), V551 (dbl), V552
##   (dbl), V553 (dbl), V554 (dbl), V555 (dbl), V556 (dbl), V557 (dbl), V558
##   (dbl), V559 (dbl), V560 (dbl), V561 (dbl), activity (int)
```

4- Appropriately labels the data set with descriptive variable names


```r
features_path <- 'UCI HAR Dataset/features.txt'
features_tbl <- tbl_dt(read.table(features_path))
names(tbl)[features_tbl$V1] <- paste(features_tbl$V1, '-', as.character(features_tbl$V2), sep = '')

tbl
```

```
## Source: local data frame [10,299 x 562]
## 
##    1-tBodyAcc-mean()-X 2-tBodyAcc-mean()-Y 3-tBodyAcc-mean()-Z
## 1            0.2885845        -0.020294171          -0.1329051
## 2            0.2784188        -0.016410568          -0.1235202
## 3            0.2796531        -0.019467156          -0.1134617
## 4            0.2791739        -0.026200646          -0.1232826
## 5            0.2766288        -0.016569655          -0.1153619
## 6            0.2771988        -0.010097850          -0.1051373
## 7            0.2794539        -0.019640776          -0.1100221
## 8            0.2774325        -0.030488303          -0.1253604
## 9            0.2772934        -0.021750698          -0.1207508
## 10           0.2805857        -0.009960298          -0.1060652
## ..                 ...                 ...                 ...
## Variables not shown: 4-tBodyAcc-std()-X (dbl), 5-tBodyAcc-std()-Y (dbl),
##   6-tBodyAcc-std()-Z (dbl), 7-tBodyAcc-mad()-X (dbl), 8-tBodyAcc-mad()-Y
##   (dbl), 9-tBodyAcc-mad()-Z (dbl), 10-tBodyAcc-max()-X (dbl),
##   11-tBodyAcc-max()-Y (dbl), 12-tBodyAcc-max()-Z (dbl),
##   13-tBodyAcc-min()-X (dbl), 14-tBodyAcc-min()-Y (dbl),
##   15-tBodyAcc-min()-Z (dbl), 16-tBodyAcc-sma() (dbl),
##   17-tBodyAcc-energy()-X (dbl), 18-tBodyAcc-energy()-Y (dbl),
##   19-tBodyAcc-energy()-Z (dbl), 20-tBodyAcc-iqr()-X (dbl),
##   21-tBodyAcc-iqr()-Y (dbl), 22-tBodyAcc-iqr()-Z (dbl),
##   23-tBodyAcc-entropy()-X (dbl), 24-tBodyAcc-entropy()-Y (dbl),
##   25-tBodyAcc-entropy()-Z (dbl), 26-tBodyAcc-arCoeff()-X,1 (dbl),
##   27-tBodyAcc-arCoeff()-X,2 (dbl), 28-tBodyAcc-arCoeff()-X,3 (dbl),
##   29-tBodyAcc-arCoeff()-X,4 (dbl), 30-tBodyAcc-arCoeff()-Y,1 (dbl),
##   31-tBodyAcc-arCoeff()-Y,2 (dbl), 32-tBodyAcc-arCoeff()-Y,3 (dbl),
##   33-tBodyAcc-arCoeff()-Y,4 (dbl), 34-tBodyAcc-arCoeff()-Z,1 (dbl),
##   35-tBodyAcc-arCoeff()-Z,2 (dbl), 36-tBodyAcc-arCoeff()-Z,3 (dbl),
##   37-tBodyAcc-arCoeff()-Z,4 (dbl), 38-tBodyAcc-correlation()-X,Y (dbl),
##   39-tBodyAcc-correlation()-X,Z (dbl), 40-tBodyAcc-correlation()-Y,Z
##   (dbl), 41-tGravityAcc-mean()-X (dbl), 42-tGravityAcc-mean()-Y (dbl),
##   43-tGravityAcc-mean()-Z (dbl), 44-tGravityAcc-std()-X (dbl),
##   45-tGravityAcc-std()-Y (dbl), 46-tGravityAcc-std()-Z (dbl),
##   47-tGravityAcc-mad()-X (dbl), 48-tGravityAcc-mad()-Y (dbl),
##   49-tGravityAcc-mad()-Z (dbl), 50-tGravityAcc-max()-X (dbl),
##   51-tGravityAcc-max()-Y (dbl), 52-tGravityAcc-max()-Z (dbl),
##   53-tGravityAcc-min()-X (dbl), 54-tGravityAcc-min()-Y (dbl),
##   55-tGravityAcc-min()-Z (dbl), 56-tGravityAcc-sma() (dbl),
##   57-tGravityAcc-energy()-X (dbl), 58-tGravityAcc-energy()-Y (dbl),
##   59-tGravityAcc-energy()-Z (dbl), 60-tGravityAcc-iqr()-X (dbl),
##   61-tGravityAcc-iqr()-Y (dbl), 62-tGravityAcc-iqr()-Z (dbl),
##   63-tGravityAcc-entropy()-X (dbl), 64-tGravityAcc-entropy()-Y (dbl),
##   65-tGravityAcc-entropy()-Z (dbl), 66-tGravityAcc-arCoeff()-X,1 (dbl),
##   67-tGravityAcc-arCoeff()-X,2 (dbl), 68-tGravityAcc-arCoeff()-X,3 (dbl),
##   69-tGravityAcc-arCoeff()-X,4 (dbl), 70-tGravityAcc-arCoeff()-Y,1 (dbl),
##   71-tGravityAcc-arCoeff()-Y,2 (dbl), 72-tGravityAcc-arCoeff()-Y,3 (dbl),
##   73-tGravityAcc-arCoeff()-Y,4 (dbl), 74-tGravityAcc-arCoeff()-Z,1 (dbl),
##   75-tGravityAcc-arCoeff()-Z,2 (dbl), 76-tGravityAcc-arCoeff()-Z,3 (dbl),
##   77-tGravityAcc-arCoeff()-Z,4 (dbl), 78-tGravityAcc-correlation()-X,Y
##   (dbl), 79-tGravityAcc-correlation()-X,Z (dbl),
##   80-tGravityAcc-correlation()-Y,Z (dbl), 81-tBodyAccJerk-mean()-X (dbl),
##   82-tBodyAccJerk-mean()-Y (dbl), 83-tBodyAccJerk-mean()-Z (dbl),
##   84-tBodyAccJerk-std()-X (dbl), 85-tBodyAccJerk-std()-Y (dbl),
##   86-tBodyAccJerk-std()-Z (dbl), 87-tBodyAccJerk-mad()-X (dbl),
##   88-tBodyAccJerk-mad()-Y (dbl), 89-tBodyAccJerk-mad()-Z (dbl),
##   90-tBodyAccJerk-max()-X (dbl), 91-tBodyAccJerk-max()-Y (dbl),
##   92-tBodyAccJerk-max()-Z (dbl), 93-tBodyAccJerk-min()-X (dbl),
##   94-tBodyAccJerk-min()-Y (dbl), 95-tBodyAccJerk-min()-Z (dbl),
##   96-tBodyAccJerk-sma() (dbl), 97-tBodyAccJerk-energy()-X (dbl),
##   98-tBodyAccJerk-energy()-Y (dbl), 99-tBodyAccJerk-energy()-Z (dbl),
##   100-tBodyAccJerk-iqr()-X (dbl), 101-tBodyAccJerk-iqr()-Y (dbl),
##   102-tBodyAccJerk-iqr()-Z (dbl), 103-tBodyAccJerk-entropy()-X (dbl),
##   104-tBodyAccJerk-entropy()-Y (dbl), 105-tBodyAccJerk-entropy()-Z (dbl),
##   106-tBodyAccJerk-arCoeff()-X,1 (dbl), 107-tBodyAccJerk-arCoeff()-X,2
##   (dbl), 108-tBodyAccJerk-arCoeff()-X,3 (dbl),
##   109-tBodyAccJerk-arCoeff()-X,4 (dbl), 110-tBodyAccJerk-arCoeff()-Y,1
##   (dbl), 111-tBodyAccJerk-arCoeff()-Y,2 (dbl),
##   112-tBodyAccJerk-arCoeff()-Y,3 (dbl), 113-tBodyAccJerk-arCoeff()-Y,4
##   (dbl), 114-tBodyAccJerk-arCoeff()-Z,1 (dbl),
##   115-tBodyAccJerk-arCoeff()-Z,2 (dbl), 116-tBodyAccJerk-arCoeff()-Z,3
##   (dbl), 117-tBodyAccJerk-arCoeff()-Z,4 (dbl),
##   118-tBodyAccJerk-correlation()-X,Y (dbl),
##   119-tBodyAccJerk-correlation()-X,Z (dbl),
##   120-tBodyAccJerk-correlation()-Y,Z (dbl), 121-tBodyGyro-mean()-X (dbl),
##   122-tBodyGyro-mean()-Y (dbl), 123-tBodyGyro-mean()-Z (dbl),
##   124-tBodyGyro-std()-X (dbl), 125-tBodyGyro-std()-Y (dbl),
##   126-tBodyGyro-std()-Z (dbl), 127-tBodyGyro-mad()-X (dbl),
##   128-tBodyGyro-mad()-Y (dbl), 129-tBodyGyro-mad()-Z (dbl),
##   130-tBodyGyro-max()-X (dbl), 131-tBodyGyro-max()-Y (dbl),
##   132-tBodyGyro-max()-Z (dbl), 133-tBodyGyro-min()-X (dbl),
##   134-tBodyGyro-min()-Y (dbl), 135-tBodyGyro-min()-Z (dbl),
##   136-tBodyGyro-sma() (dbl), 137-tBodyGyro-energy()-X (dbl),
##   138-tBodyGyro-energy()-Y (dbl), 139-tBodyGyro-energy()-Z (dbl),
##   140-tBodyGyro-iqr()-X (dbl), 141-tBodyGyro-iqr()-Y (dbl),
##   142-tBodyGyro-iqr()-Z (dbl), 143-tBodyGyro-entropy()-X (dbl),
##   144-tBodyGyro-entropy()-Y (dbl), 145-tBodyGyro-entropy()-Z (dbl),
##   146-tBodyGyro-arCoeff()-X,1 (dbl), 147-tBodyGyro-arCoeff()-X,2 (dbl),
##   148-tBodyGyro-arCoeff()-X,3 (dbl), 149-tBodyGyro-arCoeff()-X,4 (dbl),
##   150-tBodyGyro-arCoeff()-Y,1 (dbl), 151-tBodyGyro-arCoeff()-Y,2 (dbl),
##   152-tBodyGyro-arCoeff()-Y,3 (dbl), 153-tBodyGyro-arCoeff()-Y,4 (dbl),
##   154-tBodyGyro-arCoeff()-Z,1 (dbl), 155-tBodyGyro-arCoeff()-Z,2 (dbl),
##   156-tBodyGyro-arCoeff()-Z,3 (dbl), 157-tBodyGyro-arCoeff()-Z,4 (dbl),
##   158-tBodyGyro-correlation()-X,Y (dbl), 159-tBodyGyro-correlation()-X,Z
##   (dbl), 160-tBodyGyro-correlation()-Y,Z (dbl), 161-tBodyGyroJerk-mean()-X
##   (dbl), 162-tBodyGyroJerk-mean()-Y (dbl), 163-tBodyGyroJerk-mean()-Z
##   (dbl), 164-tBodyGyroJerk-std()-X (dbl), 165-tBodyGyroJerk-std()-Y (dbl),
##   166-tBodyGyroJerk-std()-Z (dbl), 167-tBodyGyroJerk-mad()-X (dbl),
##   168-tBodyGyroJerk-mad()-Y (dbl), 169-tBodyGyroJerk-mad()-Z (dbl),
##   170-tBodyGyroJerk-max()-X (dbl), 171-tBodyGyroJerk-max()-Y (dbl),
##   172-tBodyGyroJerk-max()-Z (dbl), 173-tBodyGyroJerk-min()-X (dbl),
##   174-tBodyGyroJerk-min()-Y (dbl), 175-tBodyGyroJerk-min()-Z (dbl),
##   176-tBodyGyroJerk-sma() (dbl), 177-tBodyGyroJerk-energy()-X (dbl),
##   178-tBodyGyroJerk-energy()-Y (dbl), 179-tBodyGyroJerk-energy()-Z (dbl),
##   180-tBodyGyroJerk-iqr()-X (dbl), 181-tBodyGyroJerk-iqr()-Y (dbl),
##   182-tBodyGyroJerk-iqr()-Z (dbl), 183-tBodyGyroJerk-entropy()-X (dbl),
##   184-tBodyGyroJerk-entropy()-Y (dbl), 185-tBodyGyroJerk-entropy()-Z
##   (dbl), 186-tBodyGyroJerk-arCoeff()-X,1 (dbl),
##   187-tBodyGyroJerk-arCoeff()-X,2 (dbl), 188-tBodyGyroJerk-arCoeff()-X,3
##   (dbl), 189-tBodyGyroJerk-arCoeff()-X,4 (dbl),
##   190-tBodyGyroJerk-arCoeff()-Y,1 (dbl), 191-tBodyGyroJerk-arCoeff()-Y,2
##   (dbl), 192-tBodyGyroJerk-arCoeff()-Y,3 (dbl),
##   193-tBodyGyroJerk-arCoeff()-Y,4 (dbl), 194-tBodyGyroJerk-arCoeff()-Z,1
##   (dbl), 195-tBodyGyroJerk-arCoeff()-Z,2 (dbl),
##   196-tBodyGyroJerk-arCoeff()-Z,3 (dbl), 197-tBodyGyroJerk-arCoeff()-Z,4
##   (dbl), 198-tBodyGyroJerk-correlation()-X,Y (dbl),
##   199-tBodyGyroJerk-correlation()-X,Z (dbl),
##   200-tBodyGyroJerk-correlation()-Y,Z (dbl), 201-tBodyAccMag-mean() (dbl),
##   202-tBodyAccMag-std() (dbl), 203-tBodyAccMag-mad() (dbl),
##   204-tBodyAccMag-max() (dbl), 205-tBodyAccMag-min() (dbl),
##   206-tBodyAccMag-sma() (dbl), 207-tBodyAccMag-energy() (dbl),
##   208-tBodyAccMag-iqr() (dbl), 209-tBodyAccMag-entropy() (dbl),
##   210-tBodyAccMag-arCoeff()1 (dbl), 211-tBodyAccMag-arCoeff()2 (dbl),
##   212-tBodyAccMag-arCoeff()3 (dbl), 213-tBodyAccMag-arCoeff()4 (dbl),
##   214-tGravityAccMag-mean() (dbl), 215-tGravityAccMag-std() (dbl),
##   216-tGravityAccMag-mad() (dbl), 217-tGravityAccMag-max() (dbl),
##   218-tGravityAccMag-min() (dbl), 219-tGravityAccMag-sma() (dbl),
##   220-tGravityAccMag-energy() (dbl), 221-tGravityAccMag-iqr() (dbl),
##   222-tGravityAccMag-entropy() (dbl), 223-tGravityAccMag-arCoeff()1 (dbl),
##   224-tGravityAccMag-arCoeff()2 (dbl), 225-tGravityAccMag-arCoeff()3
##   (dbl), 226-tGravityAccMag-arCoeff()4 (dbl), 227-tBodyAccJerkMag-mean()
##   (dbl), 228-tBodyAccJerkMag-std() (dbl), 229-tBodyAccJerkMag-mad() (dbl),
##   230-tBodyAccJerkMag-max() (dbl), 231-tBodyAccJerkMag-min() (dbl),
##   232-tBodyAccJerkMag-sma() (dbl), 233-tBodyAccJerkMag-energy() (dbl),
##   234-tBodyAccJerkMag-iqr() (dbl), 235-tBodyAccJerkMag-entropy() (dbl),
##   236-tBodyAccJerkMag-arCoeff()1 (dbl), 237-tBodyAccJerkMag-arCoeff()2
##   (dbl), 238-tBodyAccJerkMag-arCoeff()3 (dbl),
##   239-tBodyAccJerkMag-arCoeff()4 (dbl), 240-tBodyGyroMag-mean() (dbl),
##   241-tBodyGyroMag-std() (dbl), 242-tBodyGyroMag-mad() (dbl),
##   243-tBodyGyroMag-max() (dbl), 244-tBodyGyroMag-min() (dbl),
##   245-tBodyGyroMag-sma() (dbl), 246-tBodyGyroMag-energy() (dbl),
##   247-tBodyGyroMag-iqr() (dbl), 248-tBodyGyroMag-entropy() (dbl),
##   249-tBodyGyroMag-arCoeff()1 (dbl), 250-tBodyGyroMag-arCoeff()2 (dbl),
##   251-tBodyGyroMag-arCoeff()3 (dbl), 252-tBodyGyroMag-arCoeff()4 (dbl),
##   253-tBodyGyroJerkMag-mean() (dbl), 254-tBodyGyroJerkMag-std() (dbl),
##   255-tBodyGyroJerkMag-mad() (dbl), 256-tBodyGyroJerkMag-max() (dbl),
##   257-tBodyGyroJerkMag-min() (dbl), 258-tBodyGyroJerkMag-sma() (dbl),
##   259-tBodyGyroJerkMag-energy() (dbl), 260-tBodyGyroJerkMag-iqr() (dbl),
##   261-tBodyGyroJerkMag-entropy() (dbl), 262-tBodyGyroJerkMag-arCoeff()1
##   (dbl), 263-tBodyGyroJerkMag-arCoeff()2 (dbl),
##   264-tBodyGyroJerkMag-arCoeff()3 (dbl), 265-tBodyGyroJerkMag-arCoeff()4
##   (dbl), 266-fBodyAcc-mean()-X (dbl), 267-fBodyAcc-mean()-Y (dbl),
##   268-fBodyAcc-mean()-Z (dbl), 269-fBodyAcc-std()-X (dbl),
##   270-fBodyAcc-std()-Y (dbl), 271-fBodyAcc-std()-Z (dbl),
##   272-fBodyAcc-mad()-X (dbl), 273-fBodyAcc-mad()-Y (dbl),
##   274-fBodyAcc-mad()-Z (dbl), 275-fBodyAcc-max()-X (dbl),
##   276-fBodyAcc-max()-Y (dbl), 277-fBodyAcc-max()-Z (dbl),
##   278-fBodyAcc-min()-X (dbl), 279-fBodyAcc-min()-Y (dbl),
##   280-fBodyAcc-min()-Z (dbl), 281-fBodyAcc-sma() (dbl),
##   282-fBodyAcc-energy()-X (dbl), 283-fBodyAcc-energy()-Y (dbl),
##   284-fBodyAcc-energy()-Z (dbl), 285-fBodyAcc-iqr()-X (dbl),
##   286-fBodyAcc-iqr()-Y (dbl), 287-fBodyAcc-iqr()-Z (dbl),
##   288-fBodyAcc-entropy()-X (dbl), 289-fBodyAcc-entropy()-Y (dbl),
##   290-fBodyAcc-entropy()-Z (dbl), 291-fBodyAcc-maxInds-X (dbl),
##   292-fBodyAcc-maxInds-Y (dbl), 293-fBodyAcc-maxInds-Z (dbl),
##   294-fBodyAcc-meanFreq()-X (dbl), 295-fBodyAcc-meanFreq()-Y (dbl),
##   296-fBodyAcc-meanFreq()-Z (dbl), 297-fBodyAcc-skewness()-X (dbl),
##   298-fBodyAcc-kurtosis()-X (dbl), 299-fBodyAcc-skewness()-Y (dbl),
##   300-fBodyAcc-kurtosis()-Y (dbl), 301-fBodyAcc-skewness()-Z (dbl),
##   302-fBodyAcc-kurtosis()-Z (dbl), 303-fBodyAcc-bandsEnergy()-1,8 (dbl),
##   304-fBodyAcc-bandsEnergy()-9,16 (dbl), 305-fBodyAcc-bandsEnergy()-17,24
##   (dbl), 306-fBodyAcc-bandsEnergy()-25,32 (dbl),
##   307-fBodyAcc-bandsEnergy()-33,40 (dbl), 308-fBodyAcc-bandsEnergy()-41,48
##   (dbl), 309-fBodyAcc-bandsEnergy()-49,56 (dbl),
##   310-fBodyAcc-bandsEnergy()-57,64 (dbl), 311-fBodyAcc-bandsEnergy()-1,16
##   (dbl), 312-fBodyAcc-bandsEnergy()-17,32 (dbl),
##   313-fBodyAcc-bandsEnergy()-33,48 (dbl), 314-fBodyAcc-bandsEnergy()-49,64
##   (dbl), 315-fBodyAcc-bandsEnergy()-1,24 (dbl),
##   316-fBodyAcc-bandsEnergy()-25,48 (dbl), 317-fBodyAcc-bandsEnergy()-1,8
##   (dbl), 318-fBodyAcc-bandsEnergy()-9,16 (dbl),
##   319-fBodyAcc-bandsEnergy()-17,24 (dbl), 320-fBodyAcc-bandsEnergy()-25,32
##   (dbl), 321-fBodyAcc-bandsEnergy()-33,40 (dbl),
##   322-fBodyAcc-bandsEnergy()-41,48 (dbl), 323-fBodyAcc-bandsEnergy()-49,56
##   (dbl), 324-fBodyAcc-bandsEnergy()-57,64 (dbl),
##   325-fBodyAcc-bandsEnergy()-1,16 (dbl), 326-fBodyAcc-bandsEnergy()-17,32
##   (dbl), 327-fBodyAcc-bandsEnergy()-33,48 (dbl),
##   328-fBodyAcc-bandsEnergy()-49,64 (dbl), 329-fBodyAcc-bandsEnergy()-1,24
##   (dbl), 330-fBodyAcc-bandsEnergy()-25,48 (dbl),
##   331-fBodyAcc-bandsEnergy()-1,8 (dbl), 332-fBodyAcc-bandsEnergy()-9,16
##   (dbl), 333-fBodyAcc-bandsEnergy()-17,24 (dbl),
##   334-fBodyAcc-bandsEnergy()-25,32 (dbl), 335-fBodyAcc-bandsEnergy()-33,40
##   (dbl), 336-fBodyAcc-bandsEnergy()-41,48 (dbl),
##   337-fBodyAcc-bandsEnergy()-49,56 (dbl), 338-fBodyAcc-bandsEnergy()-57,64
##   (dbl), 339-fBodyAcc-bandsEnergy()-1,16 (dbl),
##   340-fBodyAcc-bandsEnergy()-17,32 (dbl), 341-fBodyAcc-bandsEnergy()-33,48
##   (dbl), 342-fBodyAcc-bandsEnergy()-49,64 (dbl),
##   343-fBodyAcc-bandsEnergy()-1,24 (dbl), 344-fBodyAcc-bandsEnergy()-25,48
##   (dbl), 345-fBodyAccJerk-mean()-X (dbl), 346-fBodyAccJerk-mean()-Y (dbl),
##   347-fBodyAccJerk-mean()-Z (dbl), 348-fBodyAccJerk-std()-X (dbl),
##   349-fBodyAccJerk-std()-Y (dbl), 350-fBodyAccJerk-std()-Z (dbl),
##   351-fBodyAccJerk-mad()-X (dbl), 352-fBodyAccJerk-mad()-Y (dbl),
##   353-fBodyAccJerk-mad()-Z (dbl), 354-fBodyAccJerk-max()-X (dbl),
##   355-fBodyAccJerk-max()-Y (dbl), 356-fBodyAccJerk-max()-Z (dbl),
##   357-fBodyAccJerk-min()-X (dbl), 358-fBodyAccJerk-min()-Y (dbl),
##   359-fBodyAccJerk-min()-Z (dbl), 360-fBodyAccJerk-sma() (dbl),
##   361-fBodyAccJerk-energy()-X (dbl), 362-fBodyAccJerk-energy()-Y (dbl),
##   363-fBodyAccJerk-energy()-Z (dbl), 364-fBodyAccJerk-iqr()-X (dbl),
##   365-fBodyAccJerk-iqr()-Y (dbl), 366-fBodyAccJerk-iqr()-Z (dbl),
##   367-fBodyAccJerk-entropy()-X (dbl), 368-fBodyAccJerk-entropy()-Y (dbl),
##   369-fBodyAccJerk-entropy()-Z (dbl), 370-fBodyAccJerk-maxInds-X (dbl),
##   371-fBodyAccJerk-maxInds-Y (dbl), 372-fBodyAccJerk-maxInds-Z (dbl),
##   373-fBodyAccJerk-meanFreq()-X (dbl), 374-fBodyAccJerk-meanFreq()-Y
##   (dbl), 375-fBodyAccJerk-meanFreq()-Z (dbl),
##   376-fBodyAccJerk-skewness()-X (dbl), 377-fBodyAccJerk-kurtosis()-X
##   (dbl), 378-fBodyAccJerk-skewness()-Y (dbl),
##   379-fBodyAccJerk-kurtosis()-Y (dbl), 380-fBodyAccJerk-skewness()-Z
##   (dbl), 381-fBodyAccJerk-kurtosis()-Z (dbl),
##   382-fBodyAccJerk-bandsEnergy()-1,8 (dbl),
##   383-fBodyAccJerk-bandsEnergy()-9,16 (dbl),
##   384-fBodyAccJerk-bandsEnergy()-17,24 (dbl),
##   385-fBodyAccJerk-bandsEnergy()-25,32 (dbl),
##   386-fBodyAccJerk-bandsEnergy()-33,40 (dbl),
##   387-fBodyAccJerk-bandsEnergy()-41,48 (dbl),
##   388-fBodyAccJerk-bandsEnergy()-49,56 (dbl),
##   389-fBodyAccJerk-bandsEnergy()-57,64 (dbl),
##   390-fBodyAccJerk-bandsEnergy()-1,16 (dbl),
##   391-fBodyAccJerk-bandsEnergy()-17,32 (dbl),
##   392-fBodyAccJerk-bandsEnergy()-33,48 (dbl),
##   393-fBodyAccJerk-bandsEnergy()-49,64 (dbl),
##   394-fBodyAccJerk-bandsEnergy()-1,24 (dbl),
##   395-fBodyAccJerk-bandsEnergy()-25,48 (dbl),
##   396-fBodyAccJerk-bandsEnergy()-1,8 (dbl),
##   397-fBodyAccJerk-bandsEnergy()-9,16 (dbl),
##   398-fBodyAccJerk-bandsEnergy()-17,24 (dbl),
##   399-fBodyAccJerk-bandsEnergy()-25,32 (dbl),
##   400-fBodyAccJerk-bandsEnergy()-33,40 (dbl),
##   401-fBodyAccJerk-bandsEnergy()-41,48 (dbl),
##   402-fBodyAccJerk-bandsEnergy()-49,56 (dbl),
##   403-fBodyAccJerk-bandsEnergy()-57,64 (dbl),
##   404-fBodyAccJerk-bandsEnergy()-1,16 (dbl),
##   405-fBodyAccJerk-bandsEnergy()-17,32 (dbl),
##   406-fBodyAccJerk-bandsEnergy()-33,48 (dbl),
##   407-fBodyAccJerk-bandsEnergy()-49,64 (dbl),
##   408-fBodyAccJerk-bandsEnergy()-1,24 (dbl),
##   409-fBodyAccJerk-bandsEnergy()-25,48 (dbl),
##   410-fBodyAccJerk-bandsEnergy()-1,8 (dbl),
##   411-fBodyAccJerk-bandsEnergy()-9,16 (dbl),
##   412-fBodyAccJerk-bandsEnergy()-17,24 (dbl),
##   413-fBodyAccJerk-bandsEnergy()-25,32 (dbl),
##   414-fBodyAccJerk-bandsEnergy()-33,40 (dbl),
##   415-fBodyAccJerk-bandsEnergy()-41,48 (dbl),
##   416-fBodyAccJerk-bandsEnergy()-49,56 (dbl),
##   417-fBodyAccJerk-bandsEnergy()-57,64 (dbl),
##   418-fBodyAccJerk-bandsEnergy()-1,16 (dbl),
##   419-fBodyAccJerk-bandsEnergy()-17,32 (dbl),
##   420-fBodyAccJerk-bandsEnergy()-33,48 (dbl),
##   421-fBodyAccJerk-bandsEnergy()-49,64 (dbl),
##   422-fBodyAccJerk-bandsEnergy()-1,24 (dbl),
##   423-fBodyAccJerk-bandsEnergy()-25,48 (dbl), 424-fBodyGyro-mean()-X
##   (dbl), 425-fBodyGyro-mean()-Y (dbl), 426-fBodyGyro-mean()-Z (dbl),
##   427-fBodyGyro-std()-X (dbl), 428-fBodyGyro-std()-Y (dbl),
##   429-fBodyGyro-std()-Z (dbl), 430-fBodyGyro-mad()-X (dbl),
##   431-fBodyGyro-mad()-Y (dbl), 432-fBodyGyro-mad()-Z (dbl),
##   433-fBodyGyro-max()-X (dbl), 434-fBodyGyro-max()-Y (dbl),
##   435-fBodyGyro-max()-Z (dbl), 436-fBodyGyro-min()-X (dbl),
##   437-fBodyGyro-min()-Y (dbl), 438-fBodyGyro-min()-Z (dbl),
##   439-fBodyGyro-sma() (dbl), 440-fBodyGyro-energy()-X (dbl),
##   441-fBodyGyro-energy()-Y (dbl), 442-fBodyGyro-energy()-Z (dbl),
##   443-fBodyGyro-iqr()-X (dbl), 444-fBodyGyro-iqr()-Y (dbl),
##   445-fBodyGyro-iqr()-Z (dbl), 446-fBodyGyro-entropy()-X (dbl),
##   447-fBodyGyro-entropy()-Y (dbl), 448-fBodyGyro-entropy()-Z (dbl),
##   449-fBodyGyro-maxInds-X (dbl), 450-fBodyGyro-maxInds-Y (dbl),
##   451-fBodyGyro-maxInds-Z (dbl), 452-fBodyGyro-meanFreq()-X (dbl),
##   453-fBodyGyro-meanFreq()-Y (dbl), 454-fBodyGyro-meanFreq()-Z (dbl),
##   455-fBodyGyro-skewness()-X (dbl), 456-fBodyGyro-kurtosis()-X (dbl),
##   457-fBodyGyro-skewness()-Y (dbl), 458-fBodyGyro-kurtosis()-Y (dbl),
##   459-fBodyGyro-skewness()-Z (dbl), 460-fBodyGyro-kurtosis()-Z (dbl),
##   461-fBodyGyro-bandsEnergy()-1,8 (dbl), 462-fBodyGyro-bandsEnergy()-9,16
##   (dbl), 463-fBodyGyro-bandsEnergy()-17,24 (dbl),
##   464-fBodyGyro-bandsEnergy()-25,32 (dbl),
##   465-fBodyGyro-bandsEnergy()-33,40 (dbl),
##   466-fBodyGyro-bandsEnergy()-41,48 (dbl),
##   467-fBodyGyro-bandsEnergy()-49,56 (dbl),
##   468-fBodyGyro-bandsEnergy()-57,64 (dbl),
##   469-fBodyGyro-bandsEnergy()-1,16 (dbl),
##   470-fBodyGyro-bandsEnergy()-17,32 (dbl),
##   471-fBodyGyro-bandsEnergy()-33,48 (dbl),
##   472-fBodyGyro-bandsEnergy()-49,64 (dbl),
##   473-fBodyGyro-bandsEnergy()-1,24 (dbl),
##   474-fBodyGyro-bandsEnergy()-25,48 (dbl), 475-fBodyGyro-bandsEnergy()-1,8
##   (dbl), 476-fBodyGyro-bandsEnergy()-9,16 (dbl),
##   477-fBodyGyro-bandsEnergy()-17,24 (dbl),
##   478-fBodyGyro-bandsEnergy()-25,32 (dbl),
##   479-fBodyGyro-bandsEnergy()-33,40 (dbl),
##   480-fBodyGyro-bandsEnergy()-41,48 (dbl),
##   481-fBodyGyro-bandsEnergy()-49,56 (dbl),
##   482-fBodyGyro-bandsEnergy()-57,64 (dbl),
##   483-fBodyGyro-bandsEnergy()-1,16 (dbl),
##   484-fBodyGyro-bandsEnergy()-17,32 (dbl),
##   485-fBodyGyro-bandsEnergy()-33,48 (dbl),
##   486-fBodyGyro-bandsEnergy()-49,64 (dbl),
##   487-fBodyGyro-bandsEnergy()-1,24 (dbl),
##   488-fBodyGyro-bandsEnergy()-25,48 (dbl), 489-fBodyGyro-bandsEnergy()-1,8
##   (dbl), 490-fBodyGyro-bandsEnergy()-9,16 (dbl),
##   491-fBodyGyro-bandsEnergy()-17,24 (dbl),
##   492-fBodyGyro-bandsEnergy()-25,32 (dbl),
##   493-fBodyGyro-bandsEnergy()-33,40 (dbl),
##   494-fBodyGyro-bandsEnergy()-41,48 (dbl),
##   495-fBodyGyro-bandsEnergy()-49,56 (dbl),
##   496-fBodyGyro-bandsEnergy()-57,64 (dbl),
##   497-fBodyGyro-bandsEnergy()-1,16 (dbl),
##   498-fBodyGyro-bandsEnergy()-17,32 (dbl),
##   499-fBodyGyro-bandsEnergy()-33,48 (dbl),
##   500-fBodyGyro-bandsEnergy()-49,64 (dbl),
##   501-fBodyGyro-bandsEnergy()-1,24 (dbl),
##   502-fBodyGyro-bandsEnergy()-25,48 (dbl), 503-fBodyAccMag-mean() (dbl),
##   504-fBodyAccMag-std() (dbl), 505-fBodyAccMag-mad() (dbl),
##   506-fBodyAccMag-max() (dbl), 507-fBodyAccMag-min() (dbl),
##   508-fBodyAccMag-sma() (dbl), 509-fBodyAccMag-energy() (dbl),
##   510-fBodyAccMag-iqr() (dbl), 511-fBodyAccMag-entropy() (dbl),
##   512-fBodyAccMag-maxInds (dbl), 513-fBodyAccMag-meanFreq() (dbl),
##   514-fBodyAccMag-skewness() (dbl), 515-fBodyAccMag-kurtosis() (dbl),
##   516-fBodyBodyAccJerkMag-mean() (dbl), 517-fBodyBodyAccJerkMag-std()
##   (dbl), 518-fBodyBodyAccJerkMag-mad() (dbl),
##   519-fBodyBodyAccJerkMag-max() (dbl), 520-fBodyBodyAccJerkMag-min()
##   (dbl), 521-fBodyBodyAccJerkMag-sma() (dbl),
##   522-fBodyBodyAccJerkMag-energy() (dbl), 523-fBodyBodyAccJerkMag-iqr()
##   (dbl), 524-fBodyBodyAccJerkMag-entropy() (dbl),
##   525-fBodyBodyAccJerkMag-maxInds (dbl),
##   526-fBodyBodyAccJerkMag-meanFreq() (dbl),
##   527-fBodyBodyAccJerkMag-skewness() (dbl),
##   528-fBodyBodyAccJerkMag-kurtosis() (dbl), 529-fBodyBodyGyroMag-mean()
##   (dbl), 530-fBodyBodyGyroMag-std() (dbl), 531-fBodyBodyGyroMag-mad()
##   (dbl), 532-fBodyBodyGyroMag-max() (dbl), 533-fBodyBodyGyroMag-min()
##   (dbl), 534-fBodyBodyGyroMag-sma() (dbl), 535-fBodyBodyGyroMag-energy()
##   (dbl), 536-fBodyBodyGyroMag-iqr() (dbl), 537-fBodyBodyGyroMag-entropy()
##   (dbl), 538-fBodyBodyGyroMag-maxInds (dbl),
##   539-fBodyBodyGyroMag-meanFreq() (dbl), 540-fBodyBodyGyroMag-skewness()
##   (dbl), 541-fBodyBodyGyroMag-kurtosis() (dbl),
##   542-fBodyBodyGyroJerkMag-mean() (dbl), 543-fBodyBodyGyroJerkMag-std()
##   (dbl), 544-fBodyBodyGyroJerkMag-mad() (dbl),
##   545-fBodyBodyGyroJerkMag-max() (dbl), 546-fBodyBodyGyroJerkMag-min()
##   (dbl), 547-fBodyBodyGyroJerkMag-sma() (dbl),
##   548-fBodyBodyGyroJerkMag-energy() (dbl), 549-fBodyBodyGyroJerkMag-iqr()
##   (dbl), 550-fBodyBodyGyroJerkMag-entropy() (dbl),
##   551-fBodyBodyGyroJerkMag-maxInds (dbl),
##   552-fBodyBodyGyroJerkMag-meanFreq() (dbl),
##   553-fBodyBodyGyroJerkMag-skewness() (dbl),
##   554-fBodyBodyGyroJerkMag-kurtosis() (dbl),
##   555-angle(tBodyAccMean,gravity) (dbl),
##   556-angle(tBodyAccJerkMean),gravityMean) (dbl),
##   557-angle(tBodyGyroMean,gravityMean) (dbl),
##   558-angle(tBodyGyroJerkMean,gravityMean) (dbl), 559-angle(X,gravityMean)
##   (dbl), 560-angle(Y,gravityMean) (dbl), 561-angle(Z,gravityMean) (dbl),
##   activity (int)
```

2- Extracts only the measurements on the mean and standard deviation for each measurement


```r
tbl = select(tbl, activity, contains("mean()"), contains("std()"))

tbl
```

```
## Source: local data frame [10,299 x 67]
## 
##    activity 1-tBodyAcc-mean()-X 2-tBodyAcc-mean()-Y 3-tBodyAcc-mean()-Z
## 1         5           0.2885845        -0.020294171          -0.1329051
## 2         5           0.2784188        -0.016410568          -0.1235202
## 3         5           0.2796531        -0.019467156          -0.1134617
## 4         5           0.2791739        -0.026200646          -0.1232826
## 5         5           0.2766288        -0.016569655          -0.1153619
## 6         5           0.2771988        -0.010097850          -0.1051373
## 7         5           0.2794539        -0.019640776          -0.1100221
## 8         5           0.2774325        -0.030488303          -0.1253604
## 9         5           0.2772934        -0.021750698          -0.1207508
## 10        5           0.2805857        -0.009960298          -0.1060652
## ..      ...                 ...                 ...                 ...
## Variables not shown: 41-tGravityAcc-mean()-X (dbl),
##   42-tGravityAcc-mean()-Y (dbl), 43-tGravityAcc-mean()-Z (dbl),
##   81-tBodyAccJerk-mean()-X (dbl), 82-tBodyAccJerk-mean()-Y (dbl),
##   83-tBodyAccJerk-mean()-Z (dbl), 121-tBodyGyro-mean()-X (dbl),
##   122-tBodyGyro-mean()-Y (dbl), 123-tBodyGyro-mean()-Z (dbl),
##   161-tBodyGyroJerk-mean()-X (dbl), 162-tBodyGyroJerk-mean()-Y (dbl),
##   163-tBodyGyroJerk-mean()-Z (dbl), 201-tBodyAccMag-mean() (dbl),
##   214-tGravityAccMag-mean() (dbl), 227-tBodyAccJerkMag-mean() (dbl),
##   240-tBodyGyroMag-mean() (dbl), 253-tBodyGyroJerkMag-mean() (dbl),
##   266-fBodyAcc-mean()-X (dbl), 267-fBodyAcc-mean()-Y (dbl),
##   268-fBodyAcc-mean()-Z (dbl), 345-fBodyAccJerk-mean()-X (dbl),
##   346-fBodyAccJerk-mean()-Y (dbl), 347-fBodyAccJerk-mean()-Z (dbl),
##   424-fBodyGyro-mean()-X (dbl), 425-fBodyGyro-mean()-Y (dbl),
##   426-fBodyGyro-mean()-Z (dbl), 503-fBodyAccMag-mean() (dbl),
##   516-fBodyBodyAccJerkMag-mean() (dbl), 529-fBodyBodyGyroMag-mean() (dbl),
##   542-fBodyBodyGyroJerkMag-mean() (dbl), 4-tBodyAcc-std()-X (dbl),
##   5-tBodyAcc-std()-Y (dbl), 6-tBodyAcc-std()-Z (dbl),
##   44-tGravityAcc-std()-X (dbl), 45-tGravityAcc-std()-Y (dbl),
##   46-tGravityAcc-std()-Z (dbl), 84-tBodyAccJerk-std()-X (dbl),
##   85-tBodyAccJerk-std()-Y (dbl), 86-tBodyAccJerk-std()-Z (dbl),
##   124-tBodyGyro-std()-X (dbl), 125-tBodyGyro-std()-Y (dbl),
##   126-tBodyGyro-std()-Z (dbl), 164-tBodyGyroJerk-std()-X (dbl),
##   165-tBodyGyroJerk-std()-Y (dbl), 166-tBodyGyroJerk-std()-Z (dbl),
##   202-tBodyAccMag-std() (dbl), 215-tGravityAccMag-std() (dbl),
##   228-tBodyAccJerkMag-std() (dbl), 241-tBodyGyroMag-std() (dbl),
##   254-tBodyGyroJerkMag-std() (dbl), 269-fBodyAcc-std()-X (dbl),
##   270-fBodyAcc-std()-Y (dbl), 271-fBodyAcc-std()-Z (dbl),
##   348-fBodyAccJerk-std()-X (dbl), 349-fBodyAccJerk-std()-Y (dbl),
##   350-fBodyAccJerk-std()-Z (dbl), 427-fBodyGyro-std()-X (dbl),
##   428-fBodyGyro-std()-Y (dbl), 429-fBodyGyro-std()-Z (dbl),
##   504-fBodyAccMag-std() (dbl), 517-fBodyBodyAccJerkMag-std() (dbl),
##   530-fBodyBodyGyroMag-std() (dbl), 543-fBodyBodyGyroJerkMag-std() (dbl)
```

3- Uses descriptive activity names to name the activities in the data set


```r
activity_labels_path <- 'UCI HAR Dataset/activity_labels.txt'
activity_labels_tbl <- tbl_dt(read.table(activity_labels_path))
tbl$activity <- activity_labels_tbl[tbl$activity]$V2

tbl
```

```
## Source: local data frame [10,299 x 67]
## 
##    activity 1-tBodyAcc-mean()-X 2-tBodyAcc-mean()-Y 3-tBodyAcc-mean()-Z
## 1  STANDING           0.2885845        -0.020294171          -0.1329051
## 2  STANDING           0.2784188        -0.016410568          -0.1235202
## 3  STANDING           0.2796531        -0.019467156          -0.1134617
## 4  STANDING           0.2791739        -0.026200646          -0.1232826
## 5  STANDING           0.2766288        -0.016569655          -0.1153619
## 6  STANDING           0.2771988        -0.010097850          -0.1051373
## 7  STANDING           0.2794539        -0.019640776          -0.1100221
## 8  STANDING           0.2774325        -0.030488303          -0.1253604
## 9  STANDING           0.2772934        -0.021750698          -0.1207508
## 10 STANDING           0.2805857        -0.009960298          -0.1060652
## ..      ...                 ...                 ...                 ...
## Variables not shown: 41-tGravityAcc-mean()-X (dbl),
##   42-tGravityAcc-mean()-Y (dbl), 43-tGravityAcc-mean()-Z (dbl),
##   81-tBodyAccJerk-mean()-X (dbl), 82-tBodyAccJerk-mean()-Y (dbl),
##   83-tBodyAccJerk-mean()-Z (dbl), 121-tBodyGyro-mean()-X (dbl),
##   122-tBodyGyro-mean()-Y (dbl), 123-tBodyGyro-mean()-Z (dbl),
##   161-tBodyGyroJerk-mean()-X (dbl), 162-tBodyGyroJerk-mean()-Y (dbl),
##   163-tBodyGyroJerk-mean()-Z (dbl), 201-tBodyAccMag-mean() (dbl),
##   214-tGravityAccMag-mean() (dbl), 227-tBodyAccJerkMag-mean() (dbl),
##   240-tBodyGyroMag-mean() (dbl), 253-tBodyGyroJerkMag-mean() (dbl),
##   266-fBodyAcc-mean()-X (dbl), 267-fBodyAcc-mean()-Y (dbl),
##   268-fBodyAcc-mean()-Z (dbl), 345-fBodyAccJerk-mean()-X (dbl),
##   346-fBodyAccJerk-mean()-Y (dbl), 347-fBodyAccJerk-mean()-Z (dbl),
##   424-fBodyGyro-mean()-X (dbl), 425-fBodyGyro-mean()-Y (dbl),
##   426-fBodyGyro-mean()-Z (dbl), 503-fBodyAccMag-mean() (dbl),
##   516-fBodyBodyAccJerkMag-mean() (dbl), 529-fBodyBodyGyroMag-mean() (dbl),
##   542-fBodyBodyGyroJerkMag-mean() (dbl), 4-tBodyAcc-std()-X (dbl),
##   5-tBodyAcc-std()-Y (dbl), 6-tBodyAcc-std()-Z (dbl),
##   44-tGravityAcc-std()-X (dbl), 45-tGravityAcc-std()-Y (dbl),
##   46-tGravityAcc-std()-Z (dbl), 84-tBodyAccJerk-std()-X (dbl),
##   85-tBodyAccJerk-std()-Y (dbl), 86-tBodyAccJerk-std()-Z (dbl),
##   124-tBodyGyro-std()-X (dbl), 125-tBodyGyro-std()-Y (dbl),
##   126-tBodyGyro-std()-Z (dbl), 164-tBodyGyroJerk-std()-X (dbl),
##   165-tBodyGyroJerk-std()-Y (dbl), 166-tBodyGyroJerk-std()-Z (dbl),
##   202-tBodyAccMag-std() (dbl), 215-tGravityAccMag-std() (dbl),
##   228-tBodyAccJerkMag-std() (dbl), 241-tBodyGyroMag-std() (dbl),
##   254-tBodyGyroJerkMag-std() (dbl), 269-fBodyAcc-std()-X (dbl),
##   270-fBodyAcc-std()-Y (dbl), 271-fBodyAcc-std()-Z (dbl),
##   348-fBodyAccJerk-std()-X (dbl), 349-fBodyAccJerk-std()-Y (dbl),
##   350-fBodyAccJerk-std()-Z (dbl), 427-fBodyGyro-std()-X (dbl),
##   428-fBodyGyro-std()-Y (dbl), 429-fBodyGyro-std()-Z (dbl),
##   504-fBodyAccMag-std() (dbl), 517-fBodyBodyAccJerkMag-std() (dbl),
##   530-fBodyBodyGyroMag-std() (dbl), 543-fBodyBodyGyroJerkMag-std() (dbl)
```

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


```r
gathed_tbl <- gather(tbl, subject, value, -activity)
grouped_tbl <- group_by(gathed_tbl, activity, subject) %>% summarise(mean(value))

write.table(grouped_tbl, file = "output.txt", row.name = FALSE, sep = "\t")
grouped_tbl
```

```
## Source: local data frame [396 x 3]
## Groups: activity
## 
##    activity                  subject  mean(value)
## 1    LAYING      1-tBodyAcc-mean()-X  0.268648643
## 2    LAYING      2-tBodyAcc-mean()-Y -0.018317728
## 3    LAYING      3-tBodyAcc-mean()-Z -0.107435632
## 4    LAYING  41-tGravityAcc-mean()-X -0.375021334
## 5    LAYING  42-tGravityAcc-mean()-Y  0.622270363
## 6    LAYING  43-tGravityAcc-mean()-Z  0.555612474
## 7    LAYING 81-tBodyAccJerk-mean()-X  0.081847390
## 8    LAYING 82-tBodyAccJerk-mean()-Y  0.011172357
## 9    LAYING 83-tBodyAccJerk-mean()-Z -0.004859769
## 10   LAYING   121-tBodyGyro-mean()-X -0.016725340
## ..      ...                      ...          ...
```
