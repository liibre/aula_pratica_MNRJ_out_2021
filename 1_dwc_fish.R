library(finch)
url <- "https://ipt.biodiversidad.co/sib/archive.do?r=ictiofauna_colombiana_dulceacuicola&v=2.12"

?dwca_read
#data <- dwca_read(input = url) #nao funciona!

dwc <- dwca_read(input = "data/dwca-ictiofauna_colombiana_dulceacuicola-v2.12.zip",
                 read = T)
taxon <- dwc$data$taxon.txt
typeandspecimen <- dwc$data$typesandspecimen.txt
distribution <- dwc$data$distribution.txt
description <- dwc$data$description.txt
speciesprofile <- dwc$data$speciesprofile.txt


head(taxon)
library(dplyr)
glimpse(taxon)
table(taxon$taxonRank)
