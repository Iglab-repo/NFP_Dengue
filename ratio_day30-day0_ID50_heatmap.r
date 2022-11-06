library(data.table)
library(plotly)
library(ggplot2)
library(gridExtra)
library(reshape2)
library("scales")

data123 <- fread("/hdd3/nagarajan/dengue_takeda/from_xiaoyan/serum_neutralization_data/serumdata-analysis/correlation-clustering/logvalues_ratio_day30-day0_ID50_heatmapdata.txt", header=TRUE)
melted_cormat <- melt(data123)
melted_cormat
ggplot(data = melted_cormat, aes(x=Donor, y=variable, fill=value)) + geom_tile(color = "white")+ scale_fill_gradientn(colours=c("blue","white", "red"),values=rescale(c(-1, 0, 0.08))) +coord_flip()
