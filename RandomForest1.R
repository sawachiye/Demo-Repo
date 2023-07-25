#Random Forest
#RandomForest is one of the most widely used “machine-learning” regression methods. This chapters shows how to use the method and how to inspect and evaluate RandomForest models.
install.packages("terra")
install.packages("randomForest")
install.packages("Rquefts")
install.packages("Rwofost")
#We use a few packages that are not on CRAN yet: luna, predicts, geodata, agro, and agrodata. These packages are on github and can be installed from there with the remotes package, as shown below.
#First install the remotes package if you do not have it
install.packages("remotes")

#Then use it to install the packages from github as shown below.

Sys.setenv(R_REMOTES_UPGRADE="never")
remotes::install_github("reagro/agro")
remotes::install_github("reagro/agrodata")
remotes::install_github("rspatial/luna")
remotes::install_github("rspatial/predicts")
remotes::install_github("rspatial/geodata")
remotes::install_github("cropmodels/Recocrop")
remotes::install_github("cropmodels/phenorice")

library(agrodata)
library(agro)
library(randomForest)
library(rpart)
