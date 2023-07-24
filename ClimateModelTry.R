###  Climate Model Output Data Analysis in R
install.packages("raster")
install.packages("RNetCDF")
install.packages("OpenStreetMap")
install.packages("sf")
install.packages("tsbox")
install.packages("leaflet")

library(raster)
library(RNetCDF)
library(OpenStreetMap)
library(sf)
library(tsbox)
library(leaflet)

### Acquire the Data
#Model outputs of land-based conditions like temperature and precipitation are sequences of grids covering the world over time, 
#yielding data in three dimensions: latitude, longitude, and time.
#The WCRP makes CMIP climate data available for download from the Earth System Grid Federation (ESGF) of the US Department of Energy's Lawrence Livermore National Laboratory. 
#Data as monthly scenes in NetCDF (Network Common Data Form) files, which can be converted to rasters in R for visualization and analysis.


#Go to the WCRP's cimp6 data search page.
#Under Institution ID, select the desired modeling organization. 
#For this example, we will use model outputs from NOAA-GFDL - the US National Oceanic and Atmospheric Administration's Geophysical Fluid Dynamics Laboratory.
#Under Experiment ID, select the scenario you wish to download.
#For this example we will use ssp126 for the SSP1-2.6 scenario.
#Under Frequency, select mon for monthly.
#Under Variable, select the variable you wish to download.
#Options used for the data in this tutorial include:
   #pr: precipitation_flux, kg m-2 s-1, includes both liquid and solid phases
   #tas: daily-mean near-surface (usually, 2 meter) air temperature (K)
   #tasmin: daily-minimum near-surface (usually, 2 meter) air temperature (K)
  #tasmax daily-maximum near-surface (usually, 2 meter) air temperature (K)
#Press Search.

#The displayed values may list multiple runs. For this example we use r1i1p1f1.
#Click List Files and the HTTP Download link to download the NetCDF file to your local machine.
