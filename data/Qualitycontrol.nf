
params.reads="/Users/zainabusman/RNAseq/Drosophila/data/fastq/*_{1,2}.fastqsanger"
params.qc_report="/Users/zainabusman/RNAseq/Drosophila/data/fastqc_report"
params.multi_report="/Users/zainabusman/RNAseq/Drosophila/data/multiqc_data"

process QC {

publishDir("${params.qc_report}", mode: 'copy')

input:
path reads

output:
path "*"

script:
"""
/Users/zainabusman/Home/Apps/fastQC/fastqc $reads
"""
}



workflow {
reads_ch=Channel.fromPath(params.reads)
QC(reads_ch)
QC.out.view()

}
