require(rgdal)
require(dplyr)
require(rio)
setwd("C:/DATA/disertasi/lamongan")


shape <- readOGR(dsn = ".", layer = "tuplah lamongan full")
shape <- shape[,"REMARK"]
shape$idkab <- "3524"
shape$bulan <- 6
shape$labelksa <- shape$REMARK
shape <- shape[-1,c("idkab","labelksa","bulan")]
View(shape)
writeOGR(shape, layer = 'lamongan', dsn='lamongan', driver="ESRI Shapefile") 

export(as.data.frame(table(shape$labelksa)),"label.txt")
