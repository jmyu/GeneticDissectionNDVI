
rm(list = ls())
library(tidyverse)
library(broom)
##Plot the NDVI value for each of the groups across growth stages
## Format data
DIR <- '/XXX/'
setwd(DIR)

Data17all  <- read_tsv("AmesDP_NDVI_hand_measured_trait_with_group_infor.txt")
length(unique(Data17all$New_Group))

min44DAP <- min(Data17all$NDVI_44DAP_2017)
Data17all <- Data17all[Data17all$NDVI_44DAP_2017 != min44DAP, ] %>%
  mutate(New_Group = ifelse(New_Group == "landraces", "unclassified", New_Group)) 

Data17all$New_Group <- factor(Data17all$New_Group, levels = c("sweet corn", "popcorn", "tropical", "non-stiff stalk", "stiff stalk", "unclassified"))


## Plot out the figure
tiff("Fig2_AmesDPa_NDVI_by_group.tiff", width = 15, height = 5, units = 'in', res = 600, pointsize = 14, compression = "lzw", type = "cairo")

xlabels <- c("37 DAP", "44 DAP", "60 DAP", "73 DAP","115 DAP")
x_lims <- c(0.5, 10.5)
y_lims <- c(min(min(Data17all[, 5]), min(Data17all[, 6]), min(Data17all[, 7]), min(Data17all[, 8]), min(Data17all[, 9]) ), max(max(Data17all[ , 5]), max(Data17all[ , 6]), max(Data17all[ , 7]), max(Data17all[ , 8]), max(Data17all[ , 9]) ))

par(mar =c(3, 3.5, 0.5, 0.5))

plot( 0, 0,  xlab = "", ylab = "", ylim = y_lims, xlim = x_lims,  col = "white",  xaxt = "n", yaxt="n"); 
legend("topleft", legend = c("sweet corn", "popcorn",  "tropical", "non-stiff stalk",  "stiff stalk",  "unclassified"), col = c("purple","limegreen","hotpink", "royalblue","orange", "darkgrey"), bty = "n", pch = 15, cex = 1.15 )


for(j in 1:5){

  data <- Data17all[, c(1, 4, j+4)]
  colnames(data) <- c("New_Group", "Taxa", "NDVI")
  step <- 0.75 + 2*(j -1)
  posis <- seq(from = step, to = step + 1.5, by = 0.3)
  boxplot(NDVI ~ New_Group, data = data,  at =  posis, width = c(0.06, 0.06, 0.06, 0.06, 0.06, 0.06), boxwex = 0.2, main="",xaxt="n", yaxt="n", xlab="", ylab="", col= c("purple","limegreen","hotpink", "royalblue","orange", "darkgrey"), outpch = 20, add = T, frame=F)
}

x<- seq(from = 1.5, to = 9.5, by = 2)
axis(1, mgp=c(3, .2, 0), at=x, labels=xlabels, cex.axis=1.4,tck=0, las =0)


y<- seq(from = round(y_lims[1], digits = 0), to= round(y_lims[2], digits = 0), by= round((y_lims[2]-y_lims[1])/4, digits = 0))
axis(2, mgp=c(3, .1, 0), at=y, labels=y, cex.axis=1.3, tck=.010)
mtext("NDVI (Pixel)", side=2, line=1.5, cex=1.4,las=0)

linepos <- seq(from = 2.5, to = 8.5, by = 2)

for (i in linepos){
  abline(v = i, lty = 2, lwd = 1, col = "black")
}


box(lwd = 2)
dev.off()


