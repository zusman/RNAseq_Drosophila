library(DESeq2)
library(pheatmap)
library(pheatmap)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(ggrepel)

#path to directory
setwd ('/Users/zainabusman/RNAseq/Drosophila/dseq2')

#Load count data
count_data <- read.csv('count_matrix.csv', header=TRUE, row.names=1)
colnames(count_data)
head(count_data)

#Load sample info
sample_info <- read.csv('design.csv', header=TRUE, row.names=1)
colnames(sample_info)
head(sample_info)

#Set factor levels
sample_info$Treatment <- factor(sample_info$Treatment)
sample_info$Sequencing <- factor(sample_info$Sequencing)

#Creatinf deseq object and importing count and sample info files
dds <- DESeqDataSetFromMatrix(countData = count_data, colData = sample_info, design = ~Sequencing + Treatment)



#Set reference for treatment factor
dds$Treatment <- factor(dds$Treatment, levels = c("untreated", "treated"))

#filtering genes
keep <- rowSums(counts(dds)>10) >= min(table(sample_info$Treatment))
dds <-dds[keep,]

#Performing Statistical analysis to identify differentically expressed genes
dds <- DESeq(dds)
deseq_result <- results(dds)
deseq_result

#changing DSEQ object to R object(dataframe)
deseq_result <- as.data.frame(deseq_result)
class(deseq_result)
head(deseq_result)

#order the result table by increasing p value
deseq_result_ordered <- deseq_result[order(deseq_result$pvalue),]
head(deseq_result_ordered)

#is FBgn0003360 gene differentially expressed?
deseq_result["FBgn0003360",]

#is Pasilla gene () downregulated by RNAi tretment
deseq_result["FBgn0261552",]


#EXtract the most differentially expressed genes due to the treatment
#Select genes with a significant change in gene expression (adjusted p-value below 0.05)
#filter by <0.05
filtered <- deseq_result %>% filter(deseq_result$padj < 0.05)

#filter by log of 1

filtered <- filtered %>% filter(abs(filtered$log2FoldChange) > 1 )
dim(deseq_result)
dim(filtered)

#Save deseq results (original data and filtered one)
write.csv(deseq_result, 'de_result.all.csv')
write.csv(filtered, 'de_result.filtered.csv')

#Save normalized read counts
normalized_counts <- counts(dds, normalized=TRUE)
head(normalized_counts)
write.csv(normalized_counts, 'normalized_counts.csv')

#Visulatization DEseq Results
plotDispEsts(dds)

#PCA for Principal Component Analysis
#perform variance stablizing transformation
vsd <- vst(dds,blind=FALSE)

#use transformed values to generate PCA plot
plotPCA(vsd,intgroup=c("Sequencing", "Treatment"))


#Heat Map for sample to sample distance matrix based on normalized counts
#Generate sample to sample distance matrix
sampleDists <- dist(t(assay(vsd)))
sampleDistMatrix <- as.matrix(sampleDists)
colnames(sampleDistMatrix)

#Set color code

colors <-colorRampPalette(rev(brewer.pal(9, "Reds")))(255)

#Generate HeatMap
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, clustering_distance_cols=sampleDists, col=colors)

#HeatMap of log . Top 10 genes
top_hits <- deseq_result[order(deseq_result$padj), ][1:10,]
top_hits <- row.names(top_hits)
top_hits

#perform log transformation
rld <- rlog(dds,blind=FALSE)
pheatmap(assay(rld)[top_hits,], cluster_rows=FALSE, show_rownames=TRUE,cluster_cols=FALSE)
pheatmap(assay(rld)[top_hits,])

annot_info <- as.data.frame(colData(dds)[,c('Sequencing','Treatment')])
pheatmap(assay(rld)[top_hits,], cluster_rows=FALSE, show_rownames=TRUE,cluster_cols=FALSE, annotation_col=annot_info)

#Heatmap of Zscores
cal_z_score <- function(x) {(x-mean(x)) / sd(x)}
zscore_all <- t(apply(normalized_counts, 1, cal_z_score))
zscore_subset <- zscore_all[top_hits,]
pheatmap(zscore_subset)

#MA plot
plotMA(dds,ylim=c(-2,2))


