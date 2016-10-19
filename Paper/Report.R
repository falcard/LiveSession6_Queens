
#install the gdata and plyr packages and load in to R
library(plyr)
library(gdata)

# read.csv
bk <- read.csv("/Data/rollingsales_queens.csv",skip=4,header=TRUE)

## Check the data
head(bk)

#Summary of Data
summary(bk)

##"[^[:digit:]]" refers to members of the variable name that start with digits. 
#The gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))

names(bk) <- tolower(names(bk)) # make all variable names lower case
## Get rid of leading digits
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))
bk$year.built <- as.numeric(as.character(bk$year.built))

## do a bit of exploration to make sure everything appears correct
attach(bk)
hist(sale.price.n,col="blue",main="Histogram of Sale Price") 
detach(bk)

## keep only the actual sales
bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft,bk.sale$sale.price.n,
     main="Gross Sqft. vs Sale Price", xlab="Square Feet", ylab="Sale Price",
     col="red",pch=1)

plot(log10(bk.sale$gross.sqft),log10(bk.sale$sale.price.n),
     main="Log: Gross Sqft. vs Sale Price", xlab="Square Feet", ylab="Sale Price",
     col="green",pch=1)

## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n),
     main="Gross Sqft vs Sale Prices (1,2,3 family homes): ",
     xlab="Square Feet", ylab="Sale Price",col="purple")
#summary(bk.homes[which(bk.homes$sale.price.n<100000),])

## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log10(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n),
     main="Log: Gross Sqft vs Sale Price: Remove Outliers",
     xlab="Square Feet", ylab="Sale Price",col="orange")

