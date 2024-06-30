params.index_dir="/Users/zainabusman/RNAseq/Drosophila/data/droso.fa"
params.read="/Users/zainabusman/RNAseq/Drosophila/data/fastq/*_{1,2}.fastqsanger"
params.genomeDir = "/Users/zainabusman/RNAseq/Drosophila/data/genome_index"
params.output = "/Users/zainabusman/RNAseq/Drosophila/data/mapped"

process mapping {
tag "$sample_id"

input:
tuple val(sample_id), path(read)
path  genomeDir

output:
path "*"

script:
"""
 STAR --runThreadN 2  --readFilesIn ${read}  --genomeDir ${params.genomeDir} --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${params.output}/${sample_id}.
"""
}

workflow {
index_ch=Channel.fromPath(params.genomeDir)
//fastq_ch=Channel.fromPath(params.read) .map { sample_id, read -> tuple(sample_id, read) }
fastq_ch=Channel.fromFilePairs(params.read)

mapping(fastq_ch,index_ch)
mapping.out.view()
}
