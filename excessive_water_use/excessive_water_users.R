######################################
### Programmed by Bruce Walthers   ###
### February 22nd, 2016            ###
######################################

# Set working directory
setwd("~/Documents/DS/data science tools")

# Load necessary R packages
library(ggmap)

# Load necessary data for analysis
excessive.water<-read.csv("excessive-use-report-february-25-2016-final.csv") #load winery dataset

# Laod previously loaded locations - downloaded from Google API
locs<-read.csv("excessive_use_locations.csv")

# Add lon and lat to dataset
excessive.water<-cbind(excessive.water, locs)

# Set center of map, using geocode
map.center <- geocode("Danville, CA") # make Saint Helena as main area

# Create map object
SHmap <- qmap(c(lon=map.center$lon, lat=map.center$lat), source="google", zoom=10)

# Plot excessive water use residents on map
SHmap + geom_point(
        aes(x=lon, y=lat), data=excessive.water)
