#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Yuqiao Lin
# Data: 5 January 2021
# Contact: yuqiao.lin@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
# Use R Projects, not setwd().
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Data download ####
# From https://open.toronto.ca/dataset/chemical-tracking-chemtrac/

# Datasets are grouped into 'packages' that have multiple datasets
# also called ' resources' that are relevant to that topic. So we first look at the package
# using a unique key that we obtain from the datasets webpage (see above)



# get package
package <- show_package("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# get all resources for this package
resources <- list_package_resources("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource
Apartment_Evaluation <- 
  datastore_resources %>% 
  get_resource()

#### Save data ####
write.csv(Apartment_Evaluation, "inputs/data/Apartment_Evaluation.csv")


