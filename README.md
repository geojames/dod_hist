<h1>dod_hist.m</h1>
<h2>This script creates colored histograms for Difference of DEM (DoD) analysis.</h2>
Date: 12/02/2014<br>
Author: James Dietrich - Dartmouth College, james.t.dietrich@dartmouth.edu<br>
MATLAB Version: 2014b<br>
Description: This script creates colored histograms for Difference of DEM (DoD) analysis.<br>
<h2>Workflow:</h2>
<ol>
	<li>Difference two DEMs in the GIS of your choice</li>
	<li>Convert the difference DEM to point features<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-In ArcMAp use Raster to Points</li>
	<li>Export the attribute table as a text file</li>
	<li>Import the exported text file into Matlab, only the VALUE field is needed</li>
	<li>If volumetric numbers are needed multiply the raster value(elevation change)
	by the raster cell size (in square units, x * y)</li>
	<li>Use this fuction...dod_hist(data, step, minLOD, maxLOD)<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data = your DoD data in a column vector<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;step = the bin size for the histogram<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;minLOD = the lower threshold for middle LOD section<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;maxLOD = the upper threshold for middle LOD section</li>
</ol>
