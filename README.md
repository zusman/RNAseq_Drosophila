# Git_Repo_Drosophila
 **RNASeq analysis **

This pipeline was created as part of an assessment exercise. 

**Objective:**
RNA seq analysis of Drosophila samples

**Sample set:**
The sample set comprises of 7 samples of drosophila. 
Available here: 
https://zenodo.org/records/6457007

**Note that once downloaded, these samples can be placed in the folder data-> fastq and salmon->fastq to run the pipeline. **

**Methods:**
Following steps were conducted as part of the pipeline:

1. FASTQC - Quality assessment
2. MULTIQC - Sample quality aggregation
3. STAR - Indexing and STAR alignment 
4. SALMON - Indexing and Quantification
5. DNASeq - Quantification analysis and visualization 


**Directory Information:**

**data**
This folder contains the runs for 
1. FASTQC (Qualitycontrol.nf)
2. MULTIQC (Multiqc.nf)
3. STAR (Map_Star.nf)

The reports from fastqc and multiqc are in their respective "_report"._
The mapped files can be found in "mapped" folder. It contains all the alignment related files, e.g. .bam etc. 


GenomeIndex.nf was used to run STAR genome indexing for Drosophila Melanogater. Input files contains a genome fasta file (droso.fa) and annotation file (droso.gtf) downloaded from Ensembl Genome Browser.
https://ftp.ensembl.org/pub/release-112/fasta/drosophila_melanogaster/dna/Drosophila_melanogaster.BDGP6.46.dna_sm.toplevel.fa.gz

https://ftp.ensembl.org/pub/release-112/gtf/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.46.112.gtf.gz


**Note:**
**All the scripts were run on local env and personal computer. Please adapt the paths according to your installations and folder locations**

As a next step, the pipeline can be aggreagated into one flow with params set through configurations. Thus making it more reusable and distributable. 

**salmon**
This folder contains the run for salmon 
in order to run Salmon,  Drosophila transcriptome file containing all the transcripts is downloaded from Ensembl browser. 
https://ftp.ensembl.org/pub/release-112/fasta/drosophila_melanogaster/cds/Drosophila_melanogaster.BDGP6.46.cds.all.fa.gz

1. salmonIndex (SalmonIndex.nf)
2. quants (quant_salmon.nf)

The Nexflow runs the workflow for salmon which is run through the quant.sh. Please note that paths need to be set accordingly in the .sh and .nf files. 

**dseq2**
This folder contains the run for DESeq2 and all resulting output and visualizations. 

1. dseq2.nf

All outputs are generated in their respective base working directories. 
The Nextflow runs the workflow for DNASeq which is a package in R, therefore running through R script (DESeq2.R).


