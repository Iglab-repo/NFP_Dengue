library(data.table)
library(plotly)
library(ggplot2)
library(gridExtra)

data123 <- fread("/hdd3/nagarajan/dengue_takeda/from_xiaoyan/serum_neutralization_data/serumdata-analysis/correlation-clustering/30serum_20strains_data_14APr2020_forscatterplot.in", header=TRUE)

DT<-data123[[1]];
color_list=c("#999999","#CD5C5C","#56B4E9","#E69F00");

get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}
axtit<-expression("log ID"[50])
S11<-data123[[13]]; S21<-data123[[23]]; p1<-ggplot(data123, aes(x=log10(S11), y=log10(S21), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S1'), y = expression('P30.S1'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S12<-data123[[14]]; S22<-data123[[24]]; p2<-ggplot(data123, aes(x=log10(S12), y=log10(S22), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S2'), y = expression('P30.S2'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S13<-data123[[15]]; S23<-data123[[25]]; p3<-ggplot(data123, aes(x=log10(S13), y=log10(S23), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S3'), y = expression('P30.S3'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S14<-data123[[16]]; S24<-data123[[26]]; p4<-ggplot(data123, aes(x=log10(S14), y=log10(S24), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S4'), y = expression('P30.S4'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S15<-data123[[17]]; S25<-data123[[27]]; p5<-ggplot(data123, aes(x=log10(S15), y=log10(S25), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S5'), y = expression('P30.S5'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S16<-data123[[18]]; S26<-data123[[28]]; p6<-ggplot(data123, aes(x=log10(S16), y=log10(S26), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S6'), y = expression('P30.S6'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S17<-data123[[19]]; S27<-data123[[29]]; p7<-ggplot(data123, aes(x=log10(S17), y=log10(S27), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S7'), y = expression('P30.S7'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S18<-data123[[20]]; S28<-data123[[30]]; p8<-ggplot(data123, aes(x=log10(S18), y=log10(S28), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S8'), y = expression('P30.S8'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S19<-data123[[21]]; S29<-data123[[31]]; p9<-ggplot(data123, aes(x=log10(S19), y=log10(S29), color=DT, fill=DT)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.position = "none")+xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S9'), y = expression('P30.S9'), color="DT") + geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
S20<-data123[[22]]; S30<-data123[[32]]; p10<-ggplot(data123, aes(x=log10(S20), y=log10(S30), color=DT, fill=DT)) + xlim(1,5) + ylim(1,5)+labs(x=expression('P0.S10'), y = expression('P30.S10')) +geom_abline(slope=1, intercept=0, color="grey", linetype="dashed")+theme(legend.direction ="horizontal")+theme(legend.position ="right")+geom_point(shape=21) + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list);
legend <- get_legend(p10)


p10 <- p10 + theme(legend.position="none")+ theme(legend.title = element_text(color = "black", face="bold", size = 16, family="Arial"))+theme(legend.text = element_text(color = "black", size = 12, family="Arial"))

#(x=expression('S11 (log ID'[50]*')'),


theme_set(theme_bw() + theme(legend.key = element_rect(colour = "black"),legend.title = element_text(color = "black", face="bold",size = 14, family="Arial"), legend.text = element_text(color = "black", size = 14, family="Arial")) + theme(aspect.ratio=1)+theme(axis.text.x = element_text(angle = 0)) + theme(axis.text = element_text(size = 12, face="bold",family="Arial")) + theme(axis.title = element_text(size = 14, face="bold", family="Arial")) + theme(legend.title=element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()))
#png(filename = "/hdd3/nagarajan/dengue_takeda/from_xiaoyan/serum_neutralization_data/serumdata-analysis/correlation-clustering/FIgure4A.png", width = 8, height = 6, units = "in", res = 600)
#tiff("/hdd3/nagarajan/dengue_takeda/from_xiaoyan/serum_neutralization_data/serumdata-analysis/correlation-clustering/FIgure4A.tiff", units="in", width=8, height=5, res=600)

grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,legend, nrow=5, ncol=4, layout_matrix = rbind(c(1,2,3,4),c(),c(5,6,7,8),c(),c(9,10,11,11)))
dev.off()