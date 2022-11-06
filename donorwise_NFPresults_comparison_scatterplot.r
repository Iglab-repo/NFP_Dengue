library(data.table)
library(plotly)
library(ggplot2)
library(gridExtra)

data123 <- fread("/hdd3/nagarajan/dengue_takeda/from_xiaoyan/NFP_dengue/NFP_results_dengue.txt", header=TRUE)

Specificity<-data123[[1]];
color_list=c("#008000","#999999","#CD5C5C","#56B4E9","#E69F00","#800080","#000080");
#color_list=c("#999999","#CD5C5C","#56B4E9","#E69F00");

get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

S11<-data123[[12]]; S21<-data123[[22]]; p1<-ggplot(data123, aes(x=S11, y=S21, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") + geom_point(shape=21, size=2) + theme(legend.position = "none") + scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+xlim(0,1) + ylim(0,1) + labs(x=expression('P0.S1'), y = expression('P30.S1'));
S12<-data123[[13]]; S22<-data123[[23]]; p2<-ggplot(data123, aes(x=S12, y=S22, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S2'), y = expression('P30.S2'));
S13<-data123[[14]]; S23<-data123[[24]]; p3<-ggplot(data123, aes(x=S13, y=S23, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S3'), y = expression('P30.S3'));
S14<-data123[[15]]; S24<-data123[[25]]; p4<-ggplot(data123, aes(x=S14, y=S24, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S4'), y = expression('P30.S4'));
S15<-data123[[16]]; S25<-data123[[26]]; p5<-ggplot(data123, aes(x=S15, y=S25, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S5'), y = expression('P30.S5'));
S16<-data123[[17]]; S26<-data123[[27]]; p6<-ggplot(data123, aes(x=S16, y=S26, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S6'), y = expression('P30.S6'));
S17<-data123[[18]]; S27<-data123[[28]]; p7<-ggplot(data123, aes(x=S17, y=S27, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S7'), y = expression('P30.S7'));
S18<-data123[[19]]; S28<-data123[[29]]; p8<-ggplot(data123, aes(x=S18, y=S28, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S8'), y = expression('P30.S8'));
S19<-data123[[20]]; S29<-data123[[30]]; p9<-ggplot(data123, aes(x=S19, y=S29, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.position = "none") +scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+ xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S9'), y = expression('P30.S9'));
S20<-data123[[21]]; S30<-data123[[31]]; p10<-ggplot(data123, aes(x=S20, y=S30, color=Specificity, fill=Specificity)) + geom_abline(slope=1, intercept=0, color="grey", linetype="dashed") +geom_point(shape=21, size=2) + theme(legend.direction ="horizontal")+theme(legend.position ="right")+ scale_color_manual(values=color_list)+ scale_fill_manual(values=color_list)+xlim(0,1) + ylim(0,1)+ labs(x=expression('P0.S10'), y = expression('P30.S10'))

legend <- get_legend(p10);
p10 <- p10 + theme(legend.position="none")+theme(legend.title = element_text(color = "black", face="bold", size = 16, family="Arial"))+theme(legend.text = element_text(color = "black", size = 10, family="Arial"))


theme_set(theme_bw() + theme(legend.key = element_rect(colour = "black"),legend.title = element_text(color = "black", face="bold",size = 14, family="Arial"), legend.text = element_text(color = "black", size = 11, family="Arial")) + theme(aspect.ratio=1)+theme(axis.text.x = element_text(angle = 0)) + theme(axis.text = element_text(size = 10, face="bold", family="Arial")) + theme(axis.title = element_text(size = 14, face="bold", family="Arial")) + theme(legend.title=element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank()))
#tiff("/hdd3/nagarajan/dengue_takeda/from_xiaoyan/NFP_dengue/donorwise_NFPresults_comparison_scatterplot_22Oct2021.tiff", units="in", width=12, height=5, res=300)

grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,legend, nrow=3, ncol=4, layout_matrix = rbind(c(1,2,3,4),c(5,6,7,8),c(9,10,11,11)))
dev.off()
#theme_set(theme_bw() + theme(axis.text.x = element_text(angle = 90)) + theme(axis.text = element_text(size = 10, face="bold")) + theme(axis.title = element_text(size = 12, face="bold")) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()))

#grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10, ncol=4)
