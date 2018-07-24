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
ylist =  list.files(path = dataDir, pattern = ".tsv", full.names = TRUE)
ylist = ylist[grep("_0h-", ylist)]

# calculate the sequence error rate by T-to-C ratio from the stat file
rr = c()
for(n in 1:length(xlist))
{
  # n = 1
  xx = read.csv(xlist[n], header = TRUE, row.names = 1, sep = "\t", skip = 1)
  rr =rbind(rr, c((xx$T/sum(xx$T))[which(rownames(xx)=="C")], (xx$t/sum(xx$t))[which(rownames(xx)=="C")]))
}

require(data.table)
for(n in 1:length(ylist))
{
  n = 2
  yy <-as.data.frame(fread(ylist[n], skip = 1, header = FALSE, nThread = 10))
  ts = apply(as.matrix(yy[, -1]), 2, sum)
  ts = sum(c(1:50)*ts)
  cs = apply(as.matrix(yy[, -1]), 1, sum)
  cs = sum(cs*rep(c(0:49), nrow(yy)/50))
  
  cat("estimated Pe -- " ,cs/ts, "\n")
  
}






