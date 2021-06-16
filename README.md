# batch_iGenDecPlots
Tools to create a bar plot of emphasis values for a batch of iGenDec results zip files

the iGenDec web intergace in github.com/blgolden/igendec allows users to download results of a job as a zip file.  The downloaded zip file includes an hjson file called output.hjson that contains the marginal economic values for each trait in the index (MEV) and additional statistics about each MEV.  The tools in this repository allow will draw a bar-plot of emphasis values for each run for a batch of zip files.

To use this tool, clone it to a directory of you choosing.  Then copy one or more of your zip files into that director.  Once the zip files, and the makePlots and  iGenDec_JSON_Output.R files are in the same directory you can issue the following command:

    bash makePlots

a directory called work will be made and each zip file will be unzipped into directories within work.  The makePlots will cd into each of those directories and draw a barplot for each runs' emphasis values.  The name of the bar plots will be the name of the zip file, in a work/[ZIPFILENAME_DIRECTORY]/[ZIPFILENAME].jpg.  Sounds complex but it is really easy.  Just run it and cd around.  You'll see...

This tool uses hjson-cli to conferm hjson to json files.  I use the go lang version but any hjson-cli should work.

This tool needs the following packages installed in your R implementation using install.packages():

   * library(jsonlite)
   * library(dplyr)
   * library(ggplot2)
   * library(ggrepel)
   * library(forcats)
   * library(scales)
