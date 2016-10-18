
# Doing Data Science

**Live Unit Session Assignment 6**

**Group Members:**  Kenneth Avery, James Gage, Angela Horacek, Trace Smith


```R
#install the gdata and plyr packages and load in to R
library(plyr)
library(gdata)
```

### Load Data:


```R
# read.csv
bk <- read.csv("rollingsales_queens.csv",skip=4,header=TRUE)
```


```R
## Check the data
head(bk)
```


<table>
<thead><tr><th scope=col>BOROUGH</th><th scope=col>NEIGHBORHOOD</th><th scope=col>BUILDING.CLASS.CATEGORY</th><th scope=col>TAX.CLASS.AT.PRESENT</th><th scope=col>BLOCK</th><th scope=col>LOT</th><th scope=col>EASE.MENT</th><th scope=col>BUILDING.CLASS.AT.PRESENT</th><th scope=col>ADDRESS</th><th scope=col>APARTMENT.NUMBER</th><th scope=col>⋯</th><th scope=col>RESIDENTIAL.UNITS</th><th scope=col>COMMERCIAL.UNITS</th><th scope=col>TOTAL.UNITS</th><th scope=col>LAND.SQUARE.FEET</th><th scope=col>GROSS.SQUARE.FEET</th><th scope=col>YEAR.BUILT</th><th scope=col>TAX.CLASS.AT.TIME.OF.SALE</th><th scope=col>BUILDING.CLASS.AT.TIME.OF.SALE</th><th scope=col>SALE.PRICE</th><th scope=col>SALE.DATE</th></tr></thead>
<tbody>
	<tr><td>4                                           </td><td>AIRPORT JFK                                 </td><td>31  COMMERCIAL VACANT LAND                  </td><td>4                                           </td><td>14260                                       </td><td>70                                          </td><td>NA                                          </td><td>V1                                          </td><td>181-25 EASTERN ROAD                         </td><td>                                            </td><td>⋯                                           </td><td>0                                           </td><td>0                                           </td><td>0                                           </td><td> 223,027                                    </td><td> -                                          </td><td>   0                                        </td><td>4                                           </td><td>V1                                          </td><td> 7,800,000                                  </td><td>1/14/2016                                   </td></tr>
	<tr><td>4                                           </td><td>AIRPORT LA GUARDIA                          </td><td>01  ONE FAMILY DWELLINGS                    </td><td>1                                           </td><td>  976                                       </td><td>13                                          </td><td>NA                                          </td><td>A5                                          </td><td>21-16 81ST   STREET                         </td><td>                                            </td><td>⋯                                           </td><td>1                                           </td><td>0                                           </td><td>1                                           </td><td> 1,800                                      </td><td> 1,224                                      </td><td>1950                                        </td><td>1                                           </td><td>A5                                          </td><td> 620,000                                    </td><td>10/6/2015                                   </td></tr>
	<tr><td>4                                           </td><td>AIRPORT LA GUARDIA                          </td><td>01  ONE FAMILY DWELLINGS                    </td><td>1                                           </td><td>  976                                       </td><td>61                                          </td><td>NA                                          </td><td>A5                                          </td><td>21-21 80TH   STREET                         </td><td>                                            </td><td>⋯                                           </td><td>1                                           </td><td>0                                           </td><td>1                                           </td><td> 1,800                                      </td><td> 1,224                                      </td><td>1950                                        </td><td>1                                           </td><td>A5                                          </td><td> 660,000                                    </td><td>7/26/2016                                   </td></tr>
	<tr><td>4                                           </td><td>AIRPORT LA GUARDIA                          </td><td>02  TWO FAMILY DWELLINGS                    </td><td>1                                           </td><td>  976                                       </td><td>70                                          </td><td>NA                                          </td><td>B1                                          </td><td>21-03 80TH   STREET                         </td><td>                                            </td><td>⋯                                           </td><td>2                                           </td><td>0                                           </td><td>2                                           </td><td> 1,800                                      </td><td> 1,224                                      </td><td>1950                                        </td><td>1                                           </td><td>B1                                          </td><td> -                                          </td><td>6/13/2016                                   </td></tr>
	<tr><td>4                                           </td><td>AIRPORT LA GUARDIA                          </td><td>03  THREE FAMILY DWELLINGS                  </td><td>1                                           </td><td>  949                                       </td><td>15                                          </td><td>NA                                          </td><td>C0                                          </td><td>19-08 81ST   STREET                         </td><td>                                            </td><td>⋯                                           </td><td>3                                           </td><td>0                                           </td><td>3                                           </td><td> 2,112                                      </td><td> 4,300                                      </td><td>1985                                        </td><td>1                                           </td><td>C0                                          </td><td> 940,000                                    </td><td>4/14/2016                                   </td></tr>
	<tr><td>4                                           </td><td>AIRPORT LA GUARDIA                          </td><td>03  THREE FAMILY DWELLINGS                  </td><td>1                                           </td><td>  949                                       </td><td>56                                          </td><td>NA                                          </td><td>C0                                          </td><td>19-69 80TH   STREET                         </td><td>                                            </td><td>⋯                                           </td><td>3                                           </td><td>0                                           </td><td>3                                           </td><td> 2,000                                      </td><td> 2,835                                      </td><td>1945                                        </td><td>1                                           </td><td>C0                                          </td><td> -                                          </td><td>8/15/2016                                   </td></tr>
</tbody>
</table>



### Summary of Data:


```R
summary(bk)
```


        BOROUGH                     NEIGHBORHOOD  
     Min.   :4   FLUSHING-NORTH           : 2617  
     1st Qu.:4   FOREST HILLS             : 1089  
     Median :4   BAYSIDE                  : 1074  
     Mean   :4   ASTORIA                  : 1064  
     3rd Qu.:4   JACKSON HEIGHTS          : 1013  
     Max.   :4   FLUSHING-SOUTH           :  840  
                 (Other)                  :18102  
                                     BUILDING.CLASS.CATEGORY TAX.CLASS.AT.PRESENT
     01  ONE FAMILY DWELLINGS                    :8173       1      :15079       
     02  TWO FAMILY DWELLINGS                    :5559       2      : 7306       
     10  COOPS - ELEVATOR APARTMENTS             :3757       4      : 1798       
     13  CONDOS - ELEVATOR APARTMENTS            :1792       2A     :  625       
     03  THREE FAMILY DWELLINGS                  :1273       1B     :  379       
     09  COOPS - WALKUP APARTMENTS               :1218       1A     :  375       
     (Other)                                     :4027       (Other):  237       
         BLOCK            LOT         EASE.MENT      BUILDING.CLASS.AT.PRESENT
     Min.   :   13   Min.   :   1.0   Mode:logical   A1     : 3787            
     1st Qu.: 2754   1st Qu.:  15.5   NA's:25799     D4     : 3757            
     Median : 5938   Median :  39.0                  A5     : 2021            
     Mean   : 6638   Mean   : 203.2                  B2     : 1867            
     3rd Qu.:10088   3rd Qu.:  80.0                  B3     : 1860            
     Max.   :16322   Max.   :8007.0                  R4     : 1768            
                                                     (Other):10739            
                                          ADDRESS          APARTMENT.NUMBER
     41-23 CRESCENT STREET                    :  152               :22763  
     120 BEACH 26 STREET                      :  127   3B          :   54  
     63-14 QUEENS BOULEVARD                   :   79   2B          :   50  
     142-28 38TH   AVENUE                     :   74   3A          :   50  
     106-20 70TH   AVENUE                     :   45   2A          :   49  
     2 BAY CLUB DRIVE                         :   45   4A          :   43  
     (Other)                                  :25277   (Other)     : 2790  
        ZIP.CODE     RESIDENTIAL.UNITS COMMERCIAL.UNITS     TOTAL.UNITS      
     Min.   :    0   Min.   :  0.000   Min.   :   0.0000   Min.   :   0.000  
     1st Qu.:11360   1st Qu.:  0.000   1st Qu.:   0.0000   1st Qu.:   1.000  
     Median :11375   Median :  1.000   Median :   0.0000   Median :   1.000  
     Mean   :11300   Mean   :  1.593   Mean   :   0.1742   Mean   :   1.795  
     3rd Qu.:11419   3rd Qu.:  2.000   3rd Qu.:   0.0000   3rd Qu.:   2.000  
     Max.   :11697   Max.   :442.000   Max.   :2000.0000   Max.   :2000.000  
                                                                             
     LAND.SQUARE.FEET GROSS.SQUARE.FEET   YEAR.BUILT   TAX.CLASS.AT.TIME.OF.SALE
      -     : 8405     -     : 9048     Min.   :   0   Min.   :1.000            
      4,000 : 1802     1,224 :  174     1st Qu.:1925   1st Qu.:1.000            
      2,500 : 1315     1,600 :  164     Median :1945   Median :1.000            
      2,000 : 1256     1,440 :  140     Mean   :1856   Mean   :1.526            
      3,000 :  649     1,280 :  137     3rd Qu.:1960   3rd Qu.:2.000            
      1,800 :  443     1,200 :  128     Max.   :2016   Max.   :4.000            
     (Other):11929    (Other):16008                                             
     BUILDING.CLASS.AT.TIME.OF.SALE     SALE.PRICE         SALE.DATE    
     A1     : 3787                   -       : 7875   1/20/2016 :  256  
     D4     : 3756                   10      :  208   4/5/2016  :  206  
     A5     : 2020                   450,000 :  156   2/29/2016 :  167  
     B2     : 1868                   400,000 :  141   6/30/2016 :  163  
     B3     : 1858                   600,000 :  141   10/29/2015:  153  
     R4     : 1792                   250,000 :  138   11/23/2015:  152  
     (Other):10718                  (Other)  :17140   (Other)   :24702  


### Clean & Format the Data with Regular Expressions


```R
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
```


<table>
<thead><tr><th scope=col>x</th><th scope=col>freq</th></tr></thead>
<tbody>
	<tr><td>FALSE</td><td>17924</td></tr>
	<tr><td> TRUE</td><td> 7875</td></tr>
</tbody>
</table>




```R
## do a bit of exploration to make sure everything appears correct
attach(bk)
hist(sale.price.n,col="blue",main="Histogram of Sale Price") 
detach(bk)
```


![png](Report_files/Report_9_0.png)



```R
## keep only the actual sales
bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft,bk.sale$sale.price.n,
  main="Gross Sqft. vs Sale Price", xlab="Square Feet", ylab="Sale Price",
    col="red",pch=1)
```


![png](Report_files/Report_10_0.png)



```R
plot(log10(bk.sale$gross.sqft),log10(bk.sale$sale.price.n),
main="Log: Gross Sqft. vs Sale Price", xlab="Square Feet", ylab="Sale Price",
col="green",pch=1)
```


![png](Report_files/Report_11_0.png)



```R
## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n),
     main="Gross Sqft vs Sale Prices (1,2,3 family homes): ",
     xlab="Square Feet", ylab="Sale Price",col="purple")
#summary(bk.homes[which(bk.homes$sale.price.n<100000),])
```


<ol class=list-inline>
	<li>10105</li>
	<li>24</li>
</ol>




![png](Report_files/Report_12_1.png)



```R
## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log10(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n),
     main="Log: Gross Sqft vs Sale Price: Remove Outliers",
     xlab="Square Feet", ylab="Sale Price",col="orange")
```


![png](Report_files/Report_13_0.png)


**Conclusion:** After cleansing the data and removing potential outliers, we can clearly see that as the square footage of the house increases, so does the sales price. From the plots above, a linear relationship can be observed; meaning homes with higher square footage are of higher value and vise versa 


```R

```
