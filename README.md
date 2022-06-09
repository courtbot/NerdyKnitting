# NerdyKnitting
A place to put nerdy knitting tools

The goal for this repository is to hold a bunch of nerdy knitting tools. Two things that I want to do (or have started) are: 
1. A tool that will take raw data and convert it into a knittable pattern
2. A pop-up that will remind you what color to use for your temperature blanket 

Currently the knitting pattern converter works in a 3 step process: 
1. Convert data to basic graph in r - save as image
2. Use Python to pixelate graph image and export to excel as Hexval
3. Use VBA code in the sheet to convert hexval to color/ add some basic formatting
The Example excel sheet shows the results of this process using the Waunekena Snowfall Data 
