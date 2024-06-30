params.genome = "/Users/zainabusman/RNAseq/Drosophila/data/droso.fa"
params.annotation = "/Users/zainabusman/RNAseq/Drosophila/data/droso.gtf"
params.genomeDir = "/Users/zainabusman/RNAseq/Drosophila/data/genome_index"


// Indexing of Genome
process INDEX {
publishDir("${params.genomeDir}", mode: 'copy')

input:
path genome
path annotation

output:
path "*"

script:
"""
mkdir -p ${params.genomeDir}

STAR --runThreadN 2 \
         --runMode genomeGenerate \
         --genomeDir ${params.genome_index} \
         --genomeFastaFiles droso.fa \
         --sjdbGTFfile droso.gtf \
         --genomeSAindexNbases 12 \
"""
}

workflow {
genome_ch=Channel.fromPath(params.genome)
annotation_ch=Channel.fromPath(params.annotation)
INDEX(genome_ch, annotation_ch)
}

