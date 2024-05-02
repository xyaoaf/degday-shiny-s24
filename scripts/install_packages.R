#########################################################################################
## GENERAL TIPS FOR INSTALLING PACKAGES
##
## If you are prompted by the question, "Do you want to install from sources the 
## package which needs compilation?", choose "No".
##
## If you get an error message that a package can't be installed because it's already 
## loaded and can't be stopped, restart R (Session >> Restart R), and try again.
##
## If you are working in RStudio Desktop (as opposed to Posit Cloud), running these commands 
## in R (rather than RStudio) can help resolve issues.
#########################################################################################

## Required packages from CRAN

pkgs_req <- c("sf", "tidyverse", "conflicted", "here", "units", "zoo", "degday", "cimir", "httr2", "jsonlite", "usethis", 
              "shiny", "leaflet", "glue", "DT", "plotly", "openmeteo", "caladaptr")

install.packages(pkgs_req, repos = c("https://cloud.r-project.org", "https://ajlyons.r-universe.dev"))

## Was it successful?

pkgs_missing <- pkgs_req[!(pkgs_req %in% installed.packages()[,"Package"])]

if (length(pkgs_missing)==0) {
  cat("ALL REQUIRED PACKAGES ARE INSTALLED :-) \n")
} else {
  cat("ONE OR MORE PACKAGES ARE NOT INSTALLED :-(\n", paste(pkgs_missing, collapse = ", "), "\n")
}


