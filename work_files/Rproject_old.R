library(dplyr)
set.seed(1111)
##
if (!file.exists("C:/Users/PMB/Dropbox/data/class8project1/pml-training.csv")) {
   download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", "pml-training.csv")
   #crime_2013 <- read.table("table_20_murder_by_state_types_of_weapons_2013.csv", sep = ",", header = TRUE)
   nics_check <- read.table("NICS_Firearm_Checks_-_Month_Year_by_State.csv", sep = ",", header = TRUE)
   #crime_2013 <- crime_2013[4:55, c(1,3)]
   #colnames(crime_2013)[c(1)] <- "State" 
   #colnames(crime_2013)[c(2)] <- "Gun_Homicide"

   #crime_2013$Gun_Homicide <- sapply(crime_2013$Gun_Homicide, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   #crime_2013 <- mutate(crime_2013, Per_Cap = Offense / Pop)
   nics_2014 <- nics_check[60:114, c(1,14)]
   nics_2013 <-nics_check[117:171, c(1,14)]
   nics_2012 <-nics_check[174:228, c(1,14)]
   nics_2011 <-nics_check[231:285, c(1,14)]
   nics_2010 <-nics_check[288:342, c(1,14)]
   nics_2013[,3] <- 2013
   nics_2012[,3] <- 2012
   nics_2011[,3] <- 2011
   nics_2010[,3] <- 2010
   nics_2014[,3] <- 2014
   colnames(nics_2010)[c(1)] <- "State"
   colnames(nics_2010)[c(2)] <- "Registration"
   colnames(nics_2010)[c(3)] <- "Year"
   colnames(nics_2011)[c(1)] <- "State"
   colnames(nics_2011)[c(2)] <- "Registration"
   colnames(nics_2011)[c(3)] <- "Year"
   colnames(nics_2012)[c(1)] <- "State"
   colnames(nics_2012)[c(2)] <- "Registration"
   colnames(nics_2012)[c(3)] <- "Year"
   colnames(nics_2013)[c(1)] <- "State"
   colnames(nics_2013)[c(2)] <- "Registration"
   colnames(nics_2013)[c(3)] <- "Year"
   colnames(nics_2014)[c(1)] <- "State"
   colnames(nics_2014)[c(2)] <- "Registration"
   colnames(nics_2014)[c(3)] <- "Year"
   nics_2010$Registration <- sapply(nics_2010$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   nics_2011$Registration <- sapply(nics_2011$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   nics_2012$Registration <- sapply(nics_2012$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   nics_2013$Registration <- sapply(nics_2013$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   nics_2014$Registration <- sapply(nics_2014$Registration, function(v) {as.numeric(gsub("\\,","", as.character(v)))})
   nics_master <- rbind(nics_2010, nics_2011)
   nics_master <- rbind(nics_master, nics_2012)
   nics_master <- rbind(nics_master, nics_2013)
   nics_master <- rbind(nics_master, nics_2014)
   plot(nics_2013$State, nics_2013$Registration)
   counties <- readRDS("data/counties.rds")