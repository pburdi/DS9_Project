### Rpoject_data builds the specized data frame for Analysis 
### and for the NCIS Tracker Shiny APP

##
if (!file.exists("C:/Users/PMB/Dropbox/data/class9project1/pop10_14.csv")) {
   download.file("http://www.census.gov/popest/data/national/totals/2014/files/NST-EST2014-popchg2010_2014.csv", "pop10_14.csv")}

pop_10_14 <- read.table("pop10_14.csv", sep = ",", header = TRUE)
nics_check <- read.table("NICS_Firearm_Checks_-_Month_Year_by_State.csv", sep = ",", header = TRUE)
nics_master <- data.frame(matrix(ncol = 7, nrow = 0))

nics_2010 <-nics_check[288:342, c(1,14)]  
colnames(nics_2010)[c(1)] <- "State"
colnames(nics_2010)[c(2)] <- "Registration"
nics_2011 <-nics_check[231:285, c(1,14)]
colnames(nics_2011)[c(1)] <- "State"
colnames(nics_2011)[c(2)] <- "Registration"
nics_2012 <-nics_check[174:228, c(1,14)]
colnames(nics_2012)[c(1)] <- "State"
colnames(nics_2012)[c(2)] <- "Registration"
nics_2013 <-nics_check[117:171, c(1,14)]
colnames(nics_2013)[c(1)] <- "State"
colnames(nics_2013)[c(2)] <- "Registration"
nics_2014 <- nics_check[60:114, c(1,14)]
colnames(nics_2014)[c(1)] <- "State"
colnames(nics_2014)[c(2)] <- "Registration"

pop_10_14$POPESTIMATE2010 <- sapply(pop_10_14$POPESTIMATE2010, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
nics_2010$Registration <- sapply(nics_2010$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
nics_2011$Registration <- sapply(nics_2011$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
nics_2012$Registration <- sapply(nics_2012$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
nics_2013$Registration <- sapply(nics_2013$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
nics_2014$Registration <- sapply(nics_2014$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})


pop_10_14[,7] <- as.numeric(pop_10_14[,7])
pop_10_14[,5] <- as.character(pop_10_14[,5])
nics_2010[,2] <- as.numeric(nics_2010[,2])
nics_2010[,1] <- as.character(nics_2010[,1])
nics_2011[,2] <- as.numeric(nics_2011[,2])
nics_2011[,1] <- as.character(nics_2011[,1])
nics_2012[,2] <- as.numeric(nics_2012[,2])
nics_2012[,1] <- as.character(nics_2012[,1])
nics_2013[,2] <- as.numeric(nics_2013[,2])
nics_2013[,1] <- as.character(nics_2013[,1])
nics_2014[,2] <- as.numeric(nics_2014[,2])
nics_2014[,1] <- as.character(nics_2014[,1])

for (w in 1:nrow(pop_10_14)){
   for (x in 1:nrow(nics_2010)){
   if (pop_10_14[w,5] == nics_2010[x,1]){
      nics_master[x,1] <- nics_2010[x,1]
      nics_master[x,2] <- nics_2010[x,2]
      nics_master[x,3] <- round(100*(nics_2010[x,2]/pop_10_14[w,7]), digits = 1)
      }
   }
   for (x in 1:nrow(nics_2011)){
      if (pop_10_14[w,5] == nics_2011[x,1]){
         nics_master[x,4] <- round(100*(nics_2011[x,2]/pop_10_14[w,8]), digits = 1)
      }
   }
   for (x in 1:nrow(nics_2012)){
      if (pop_10_14[w,5] == nics_2012[x,1]){
         nics_master[x,5] <- round(100*(nics_2012[x,2]/pop_10_14[w,9]), digits = 1)
      }
   }
   for (x in 1:nrow(nics_2013)){
      if (pop_10_14[w,5] == nics_2013[x,1]){
         nics_master[x,6] <- round(100*(nics_2013[x,2]/pop_10_14[w,10]), digits = 1)
      }
   }
   for (x in 1:nrow(nics_2014)){
      if (pop_10_14[w,5] == nics_2014[x,1]){
         nics_master[x,7] <- round(100*(nics_2014[x,2]/pop_10_14[w,11]), digits = 1)
      }
   }
}

colnames(nics_master)[c(1)] <- "State"
colnames(nics_master)[c(2)] <- "Number_Checks"
colnames(nics_master)[c(3)] <- "P2010"
colnames(nics_master)[c(4)] <- "P2011"
colnames(nics_master)[c(5)] <- "P2012"
colnames(nics_master)[c(6)] <- "P2013"
colnames(nics_master)[c(7)] <- "P2014"

row.has.na <- apply(nics_master, 1, function(x){any(is.na(x))})
nics_master <- nics_master[!row.has.na,]
### nics_master$State <- tolower(nics_master$name)

saveRDS(nics_master, file="nics_master.rds")

cschema <- readRDS("counties.rds")


colnames(cschema)[c(2)] <- "NOTUSED"
colnames(cschema)[c(3)] <- "P2012"
colnames(cschema)[c(4)] <- "P2013"
colnames(cschema)[c(5)] <- "P2014"
colnames(cschema)[c(6)] <- "P3"

cschema[,2] <- 0

for (w in 1:nrow(nics_master)){
         cschema[grep(nics_master[w,1], cschema$name), 3] <- nics_master[w,5]
         cschema[grep(nics_master[w,1], cschema$name), 4] <- nics_master[w,6]
         cschema[grep(nics_master[w,1], cschema$name), 5] <- nics_master[w,7]
         cschema[grep(nics_master[w,1], cschema$name), 6] <- 100 - (nics_master[w,5] + nics_master[w,6] + nics_master[w,7])
         cschema[grep(nics_master[w,1], cschema$name), 6]
}

saveRDS(cschema, file="counties_mod.rds")
  