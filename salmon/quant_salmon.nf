
params.baseDir ="/Users/zainabusman/RNAseq/Drosophila/salmon/fastq"
params.indexDir ="/Users/zainabusman/RNAseq/Drosophila/salmon/salmonIndex"
params.outputDir ="/Users/zainabusman/RNAseq/Drosophila/salmon/quants"

process quant {

input:
path baseDir
path indexDir
path outputDir

output:
path outputDir

script:
"""
bash /Users/zainabusman/RNAseq/Drosophila/salmon/quant.sh 

"""

}

workflow {

baseDir_ch =Channel.fromPath(params.baseDir)
indexDir_ch =Channel.fromPath(params.indexDir)
outputDir_ch =Channel.fromPath(params.outputDir)
quant(baseDir_ch, indexDir_ch, outputDir_ch)
}