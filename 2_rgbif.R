install.packages("rgbif")
install.packages("remotes")
remotes::install_github("ropensci/CoordinateCleaner")


library(rgbif)
library(CoordinateCleaner)

species <- "Tapirus terrestris"
tapirus <- occ_search(scientificName = species,
           basisOfRecord = "PRESERVED_SPECIMEN",
           limit = 10000)
class(tapirus)
names(tapirus)
head(tapirus$data)
dim(tapirus$data)

data_tapirus <- tapirus$data
table(data_tapirus$taxonomicStatus)
unique(data_tapirus$scientificName)

table(data_tapirus$scientificName, data_tapirus$taxonomicStatus)

#data_tapirus[linhas, colunas]
data_tapirus[, c("scientificName", "acceptedScientificName")] %>% unique()

#
names(data_tapirus)
data_tapirus[, c("decimalLatitude", "decimalLongitude")]
tem_coordenada <- complete.cases(data_tapirus[, c("decimalLatitude", "decimalLongitude")])

coord_tapirus <- data_tapirus[ tem_coordenada , ]


clean <- clean_coordinates(x = coord_tapirus, 
                  lon = "decimalLongitude",
                  lat = "decimalLatitude",
                  species = "acceptedScientificName"
                  )
clean

coord_tapirus[clean$.summary, ]
