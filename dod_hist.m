function [ output_args ] = dod_hist( inDOD, step, minLOD, maxLOD )
%dod_hist.m This script creates colored histograms for Difference of DEM (DoD) analysis.
%   
% DoD_hist.m
% Date: 12/02/2014
% Author: James Dietrich - Dartmouth College, james.t.dietrich@dartmouth.edu
% MATLAB Version: 2014b
% Description: This script creates colored histograms for Difference of 
%              DEM (DoD) analysis.
% Workflow: 1) Difference two DEMs in the GIS of your choice
%           2) Convert the difference DEM to point features
%               - In ArcMAp use Raster to Points
%           3) Export the attribute table as a text file
%           4) Import the exported text file into Matlab, only the VALUE
%               field is needed
%           5) If volumetric numbers are needed multiply the raster value
%               (elevation change) by the raster cell size (in square
%               units, x * y)
%           6) Use this fuction...dod_hist(data, step, minLOD, maxLOD)
%               data = your DoD data in a column vector
%               step = the bin size for the histogram
%               minLOD = the lower threshold for middle LOD section
%               maxLOD = the upper threshold for middle LOD section
% -------------------------------------------------------------------------
% Licence
% Copyright (c) 2014, James T. Dietrich (james.t.dietrich@dartmouth.edu)
% 
% Permission to use, copy, modify, and/or distribute this software for any
% purpose with or without fee is hereby granted, provided that the above
% copyright notice and this permission notice appear in all copies.
% 
% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
% -------------------------------------------------------------------------

%inDOD = random('norm',0,1,1,1000)'; % random dataset for testing

min_diff = floor(min(inDOD));   % calulates and rounds down the min value in the input data
max_diff = ceil(max(inDOD));    % calulates and rounds up the max value in the input data

edges = (min_diff:step:max_diff)';  %creates an array of histogram steps for the data

% separate the different parts fo the histogram
% adjust the threshold to match the limit of difference (LOD) for the DoD
% analysis
%
% if the neutral doesn't show up the step size is larger that the theshold
%   adjust either the step size or the threshold.

neg_hist = inDOD < minLOD;                         % negative change
pos_hist = inDOD > maxLOD;                          % positive change
neut_hist = (inDOD >= minLOD & inDOD <= maxLOD);     % neutral change

% plot each histogram using the same bin edges
% color the different segments differently
histogram(inDOD(neg_hist),edges,'FaceColor','b','EdgeColor','none','FaceAlpha',1);
hold on
histogram(inDOD(pos_hist),edges,'FaceColor','r','EdgeColor','none','FaceAlpha',1);

% two neutral version (gray and white), comment out the one you don't want
histogram(inDOD(neut_hist),edges,'FaceColor','w','FaceAlpha',1);
%histogram(inDOD(neut_hist),edges,'FaceColor',[0.6 0.6 0.6],'EdgeColor',[0.3 0.3 0.3],'FaceAlpha',1);

% Additional plot formatting can be added here...

end

