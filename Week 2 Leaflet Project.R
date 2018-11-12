
#Install Leaflet Package

install.packages("leaflet")

# Load Data
FOOD = read.csv("~/Documents/DataScience/Course 9/Foodie Chicago.csv")

head(FOOD)
#Leaflet Map Widget
library(leaflet)
library(htmlwidgets)
library(htmltools)

my_map <- leaflet() %>% 
  addTiles()
my_map

tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title { 
                                 transform: translate(-50%,20%);
                                 position: fixed !important;
                                 left: 50%;
                                 text-align: center;
                                 padding-left: 10px; 
                                 padding-right: 10px; 
                                 background: rgba(255,255,255,0.75);
                                 font-weight: bold;
                                 font-size: 28px;
                                 }
                                 "))

title <- tags$div(
  tag.map.title, HTML("Chicago Foodie Trip")
)  

## Making Custom Markers

foodIcon <- makeIcon(
  iconUrl = "https://shinnstonnews.com/wp-content/uploads/2017/05/food_icon_1493922240.png",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230/2, iconAnchorY = 16
)
foodSites <- FOOD$Description
foodType <- FOOD$Desc
ChicagoFoodieLatLong <- data.frame(
  lat = FOOD$lat,
  lng = FOOD$lng)
ChicagoFoodieLatLong %>% 
  leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addControl(title, position = "topleft", className="map-title") %>%
  addMarkers(icon = foodIcon,
             popup = paste(foodSites, "<br>",
                     foodType))

            

    