#!/usr/bin/Rscript

# Draw a bar plot from the emphasis values of iGenDec

library(jsonlite)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(forcats)
library(scales)

# This plot title is given on the command line
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
	stop("Please provide a plot title on the command line")
} else {
	Title = args[1]
}

# Read the json data, not hson so you will need to convert
data1 <- fromJSON("output.json", flatten=FALSE)
data1

# Convert from list to data frame
df <- as.data.frame(data1)

# Prune the "indexElement." key off the front of the column names
names(df) <- substring(names(df), 14)

# write plot to jpg file 
plotTitle = paste(Title, ".jpg", sep="")

jpeg(file = plotTitle)

df$emphasis <- round(df$emphasis * 100, digits=2)

d <- df[order(df$emphasis),]

d$trait <- paste(d$trait, d$component, sep = "_")

# create the bar plot
bp <- ggplot(d, aes(x=trait, y=emphasis, fill=trait)) + 
	geom_col(position="dodge", stat = "identity", show.legend=FALSE) +
	ggtitle(Title) +
	ylim(0, 100) +
	theme(text = element_text(size=18)) +
	geom_text(aes(label=emphasis), position=position_dodge(width=0.9))

bp

dev.off()
