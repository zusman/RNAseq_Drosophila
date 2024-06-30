params.transcriptome = "/Users/zainabusman/RNAseq/Drosophila/salmon/droso.fa.gz"
params.annotation = "/Users/zainabusman/RNAseq/Drosophila/salmon/droso.gtf.gz"
params.indexDir = "/Users/zainabusman/RNAseq/Drosophila/salmon/salmonIndex"


// Indexing of Genome
process SalmonIndex {
publishDir("${params.indexDir}", mode: 'copy')

input:
path transcriptome

output: 
path "*"

script:
"""
salmon index -t $transcriptome -i ${params.indexDir} 
"""
}

workflow {
transcriptome_ch=Channel.fromPath(params.transcriptome)
SalmonIndex(transcriptome_ch)
}

