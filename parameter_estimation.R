##########################################################################
##########################################################################
## Project: modeling the slamseq output 
## Script purpose: parameter estimation for slamseq output
## Usage example: 
## Author: Jingkui Wang (jingkui.wang@imp.ac.at)
## Date of creation: Tue Jul 24 09:50:08 2018
##########################################################################
##########################################################################

## import the overall stat files
dataDir = "data"
xlist = list.files(path = dataDir, pattern = "slamdunk_mapped_filtered_overallrates.csv", full.names = TRUE)
xlist = xlist[grep("_0h-", xlist)]

for(n in 1:length(xlist))
{
  n = 1
  xx = read.csv(xlist[n], header = TRUE, comment.char = "#", row.names = 1)
}
