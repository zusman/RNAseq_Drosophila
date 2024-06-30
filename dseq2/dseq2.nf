nextflow.enable.dsl=2

process deseqR {

input:
path count_data
path sample_info

output:
path  'deseq_result.all.csv'
path 'deseq_result.filtered.csv'
path 'normalized_counts.csv'

script:
"""
Rscript /Users/zainabusman/RNAseq/Drosophila/dseq2/DESeq2.R $count_data $sample_info deseq_result.all.csv deseq_result.filtered.csv normalized.counts.csv
"""

}

workflow {
count_data_ch =Channel.fromPath('count_matrix.csv')
sample_info_ch= Channel.fromPath('design.csv')
deseqR(count_data_ch, sample_info_ch)
}