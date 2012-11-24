require(stringr)
require(gdata)
require(plyr)

### Load in data and mark NA value
data <- read.csv("C:/Users/Zaiming/Documents/GitHub/Ada_Project/ada data.csv", header=FALSE, sep=",", 
         na.strings="?", stringsAsFactors=FALSE)
data[,147] <- as.numeric(str_replace_all(trim(data[,147]), '[[:punct:]]', ""))



### Load in Variable names 
attr_name <- read.delim("C:/Users/Zaiming/Documents/GitHub/Ada_Project/attr_name.txt", header=F, sep="\\")
attr_name2 <- apply(attr_name, 1, function(x) str_extract(string=x, pattern="--(\\w| )+:"))
attr_name2 <- ldply(attr_name2, function(x) str_replace_all(x, "(-| |:)", ""))

# assign feature names to data 
names(data) <- attr_name2[,1]

write.csv(data,"C:/Users/Zaiming/Documents/GitHub/Ada_Project/FD.csv")

