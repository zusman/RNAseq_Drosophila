
params.qc_report="/Users/zainabusman/RNAseq/Drosophila/data/fastqc_report/"
params.multi_report="/Users/zainabusman/RNAseq/Drosophila/data/multiqc_report"


process  multiQC {

publishDir("${params.multi_report}", mode: 'copy')

input:
path qc_report


output:
path "*"

script:
"""
/opt/anaconda3/bin/MultiQC $qc_report 

"""
}

workflow {

multiQC_ch=Channel.fromPath(params.qc_report)
multiQC(multiQC_ch)
multiQC.out.view()
}

