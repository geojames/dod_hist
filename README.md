dod_hist
========
 DoD_hist.m
 Date: 12/02/2014
 Author: James Dietrich - Dartmouth College, james.t.dietrich@dartmouth.edu
 MATLAB Version: 2014b
 Description: This script creates colored histograms for Difference of 
              DEM (DoD) analysis.
 Workflow: 1) Difference two DEMs in the GIS of your choice
           2) Convert the difference DEM to point features
               - In ArcMAp use Raster to Points
           3) Export the attribute table as a text file
           4) Import the exported text file into Matlab, only the VALUE
               field is needed
           5) If volumetric numbers are needed multiply the raster value
               (elevation change) by the raster cell size (in square
               units, x * y)
           6) Use this fuction...dod_hist(data, step, minLOD, maxLOD)
               data = your DoD data in a column vector
               step = the bin size for the histogram
               minLOD = the lower threshold for middle LOD section
               maxLOD = the upper threshold for middle LOD section