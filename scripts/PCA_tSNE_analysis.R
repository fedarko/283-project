# Performing PCA and tSNE to find outliers

library(ggplot2)
library(Rtsne)

cancerdata <- read.table("../data/GSE131512_cancerTPM.txt", head = TRUE, row.names = 1, sep = "\t")
normaldata <- read.table("../data/GSE131512_normalTPM.txt", head = TRUE, row.names = 1, sep = "\t")

all.equal(rownames(cancerdata),rownames(normaldata))
combined <- cbind(cancerdata, normaldata)

cancer_gr <- factor(c(rep("recurrence", times = 28),
                     rep("non-recurrence", times = 68)))

combined_gr <- factor(c(rep("recurrence", times = 28),
                       rep("non-recurrence", times = 68),
                       rep("normal", times = 32)))

eliminrows <- c()
for (i in 1:nrow(combined)){
  if (sum(combined[i,]) == 0 | max(combined[i,]) < 5) {
    eliminrows <- c(eliminrows, i)
  }
}

keptrows <- setdiff(c(1:nrow(combined)), eliminrows)
combined_up <- combined[keptrows, ]
cancerdata_up <- cancerdata[keptrows, ]

# ---------------------------------------------------------------------------------------
# PCA and tSNE analysis:

for (i in c(1,2)) {
  set.seed(1)
  if (i == 1) {
    data <- cancerdata_up
    groups <- cancer_gr
  } else {
    data <- combined_up
    groups <- combined_gr
  }
  
    themep <- theme(axis.text.x = element_text(size = 12)) +
    theme(axis.text.y = element_text(size = 12)) +
    theme(axis.title = element_text(size = 12, face = "bold"))+
    theme(legend.title = element_text(size = 14),
          legend.text = element_text(size = 12))
  
  # -------------------------------------------------------------------------------------
  # PCA analysis:
  
  pca <- prcomp(t(data))
  pca_out <- as.data.frame(pca$x)
  pca_out$group <- groups
  
  percentage <- round(pca$sdev / sum(pca$sdev) * 100, 2)
  percentage <- paste(colnames(pca_out), "(",
                      paste(as.character(percentage),"%", ")", sep = ""))
  
  pdfname <- paste0("PCA", i, ".pdf")
  pdf(file = pdfname, width = 11, height = 8.5)
    
  p <- ggplot(pca_out,aes(x = PC1, y = PC2, color = group, hjust = -0.2, vjust = 0.4))
  p <- p + geom_point() + xlab(percentage[1]) + ylab(percentage[2]) + themep

  plot(p)
  dev.off()
  
  # -------------------------------------------------------------------------------------
  # tSNE analysis:
  
  tsne_out <- Rtsne(t(data), pca = FALSE, perplexity = 30, theta = 0.0)
  tsne_plot <- data.frame(x = tsne_out$Y[,1], y = tsne_out$Y[,2], group = groups)
  
  pdfname <- paste0("tSNE", i, ".pdf")
  pdf(file = pdfname, width = 11, height = 8.5)
  
  p <- ggplot(tsne_plot)
  p <- p + geom_point(aes(x = x, y = y, color = group)) + 
    labs(y="tSNE dimension 2", x = "tSNE dimension 1") + themep
  
  plot(p)
  dev.off()
}
