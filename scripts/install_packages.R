#########################################################################################
## PRO TIPS
##
## If you are prompted by the question, "Do you want to install from sources the 
## package which needs compilation?", choose "No".
##
## If you get an error message that a package can't be installed because it's already 
## loaded and can't be stopped, restart R (Session >> Restart R), and try again.
#########################################################################################


## Required packages from CRAN

#"rlang", "cli", "vctrs", 

pkgs_req <- c("tidyverse", "conflicted", "here", "units", "zoo", "degday", "cimir", "httr2", "usethis", 
              "shiny", "leaflet", "glue", "DT", "plotly", "openmeteo")

install.packages(pkgs_req, dependencies = TRUE)
install.packages("cli", dependencies = TRUE)

## removed
# "tmap", 
# "remotes", 
# "chillR", 
# "sf", 
## "shinyjs"

# "rlang" openmeteo requires rlang >= 1.1.3
# "rlang"  namespace ‘vctrs’ 0.6.3 is already loaded, but >= 0.6.5 is required
# namespace ‘cli’ 3.6.1 is already loaded, but >= 3.6.2 is required
# install.packages("cli")

#pkgs_missing <- pkgs_req

## See which CRAN packages are missing
(pkgs_missing <- pkgs_req[!(pkgs_req %in% installed.packages()[,"Package"])])

## Install missing CRAN packages
if (length(pkgs_missing)) install.packages(pkgs_missing, dependencies=TRUE)

## Re-run the check for missing CRAN packages
pkgs_missing <- pkgs_req[!(pkgs_req %in% installed.packages()[,"Package"])]
if (length(pkgs_missing)==0) cat("ALL CRAN PACKAGES WERE INSTALLED SUCCESSFULLY \n")


################
## Install two packages from R-Universe:

if (!"wrkshputils" %in% installed.packages()[,"Package"]) {
  install.packages("wrkshputils", dependencies=TRUE, repos = "https://ajlyons.r-universe.dev")
}

if (!"caladaptr" %in% installed.packages()[,"Package"]) {
  install.packages("caladaptr", dependencies=TRUE, repos = "https://ajlyons.r-universe.dev")
}

