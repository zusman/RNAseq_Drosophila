# Git_Repo_Drosophila
 **RNASeq analysis **

This pipeline was created as part of an assessment exercise. 

**Obejective:**
To analyze the Human samples for RNA Seq analysis with steps categorizing the base RNA Seql pipeline. The human samples and genomes indexing was not possible to run on the personal computers. Although I tried but failed at HDD space, after running for over 60 hours on the personal computer. See details in the Task.ppt file. 

**Sample set:**
In oder to retain the essence of the assessment exercise, similar steps were carried out but on a smaller sample. The sample set comprises of 7 samples of drosophila. 

Available here: 
https://zenodo.org/records/6457007

**Note that once downloaded, these samples can be placed in the folder data-> fastq and salmon->fastq to run the pipeline. **


**Methods:**
Following steps were conducted as part of the pipeline:

1. FASTQC - Quality assessment
2. MULTIQC - Sample quality aggregation
3. STAR - Allignment and sorted Indexing
4. SALMON - Indexing and Quantification
5. DNASeq - Quantification analysis and visualization 


**Directory Information:**

**data**
This folder contains the runs for 
1. FASTQC (Qualitycontrol.nf)
2. MULTIQC (Multiqc.nf)
3. STAR (Map_Star.nf)

The reports from fastqc and multiqc are in their respective "_report"._
The mapped files can be found in "mapped" folder. It contains all the alligment related files, e.g. .bam etc. 

GenomeIndex.nf was used to run STAR based genome indexing. 

droso.fa - is the Drosophila genome file. 

**Note:**
**All the scripts were run on local env and personal computer. Please adapt the paths according to your installations and folder locations**

As a next step, the pipeline can be aggreagated into one flow with params set through configurations. Thus making it more reusable and distributeable. 

**salmon**
This folder contains the run for salmon 

1. salmonIndex (SalmonIndex.nf)
2. quants (quant_salmon.nf)

**dseq2**
This folder contains the run for DESeq2 and all resulting output and visualizations. 

1. dseq2.nf

All outputs are generated in their respective base working directories. 



