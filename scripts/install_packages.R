#########################################################################################
## TIPS
##
## If you are prompted by the question, "Do you want to install from sources the 
## package which needs compilation?", choose "No".
##
## If you get an error message that a package can't be installed because it's already 
## loaded and can't be stopped, restart R (Session >> Restart R), and try again.
##
## Running these commands in the R console (i.e., not RStudio) can help also.
#########################################################################################

## Required packages from CRAN

pkgs_req <- c("tidyverse", "conflicted", "here", "units", "zoo", "degday", "cimir", "httr2", "jsonlite", "usethis", 
              "shiny", "leaflet", "glue", "DT", "plotly", "openmeteo")

install.packages(pkgs_req, dependencies = TRUE)

