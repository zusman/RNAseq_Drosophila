params {
    transcriptome = "/Users/zainabusman/RNAseq/Drosophila/salmon/droso.fa"
    indexDir = "/Users/zainabusman/RNAseq/Drosophila/salmon/salmonIndex"
outputDir = "/Users/zainabusman/RNAseq/Drosophila/salmon/quant"
samples = [
        [id: 'sample1', reads1: '/Users/zainabusman/RNAseq/Drosophila/salmon/fastq/GSM461177_1.fastqsanger', reads2: '/Users/zainabusman/RNAseq/Drosophila/salmon/fastq/GSM461177_2.fastqsanger'],
    [id: 'sample2', reads1: '/Users/zainabusman/RNAseq/Drosophila/salmon/fastq/GSM461180_1.fastqsanger', reads2: 'Users/zainabusman/RNAseq/Drosophila/salmon/fastq/GSM461180_2.fastqsanger']
]
}

process {
    executor = 'local'
    cpus = 2
    memory = '4 GB'
}
