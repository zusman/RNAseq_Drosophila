!/bin/bash

# Define the base directory containing FASTQ files
baseDir="/Users/zainabusman/RNAseq/Drosophila/salmon/fastq"

# Define the directory where the Salmon index is located
indexDir="/Users/zainabusman/RNAseq/Drosophila/salmon/salmonIndex"

# Define the output directory for the quantification results
outputDir="/Users/zainabusman/RNAseq/Drosophila/salmon/quants"

# Ensure the output directory exists
mkdir -p $outputDir

# Loop through the FASTQ files and process them with Salmon
for fn in $baseDir/GSM4611{77,78,80,81}_1.fastq; do
    samp=`basename ${fn} _1.fastq`
    echo "Processing sample ${samp}"

    salmon quant -i $indexDir -l A \
        -1 ${baseDir}/${samp}_1.fastq \
        -2 ${baseDir}/${samp}_2.fastq \
        -p 8 --validateMappings -o ${outputDir}/${samp}_quant
done

