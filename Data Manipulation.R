require(stringr)
require(gdata)
data <- read.csv("C:/Users/Zaiming/Documents/GitHub/Ada_Project/ada data.csv", header=FALSE, sep=",", 
         na.strings="?", stringsAsFactors=FALSE)

head(data,1)
data[,147] <- as.numeric(str_replace_all(trim(data[,147]), '[[:punct:]]', ""))

