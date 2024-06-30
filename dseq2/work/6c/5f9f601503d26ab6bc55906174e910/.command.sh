#!/bin/bash -ue
Rscript /Users/zainabusman/RNAseq/Drosophila/deseq2/DESeq2.R count_matrix.csv design.csv deseq_result.all.csv deseq_result.filtered.csv normalized.counts.csv
