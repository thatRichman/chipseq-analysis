#!/bin/bash

# run mode
# number of threads to use
# location to output indices
# location of genome fasta file(s)
# location of annotation file
# specify overhang ReadLength-1 or default 100 which is usually good enough

STAR --runMode genomeGenerate\
     --runThreadN 10\
     --genomeDir /home/spencer/chipseq-analysis/reference_data\
     --genomeFastaFiles /home/spencer/chipseq-analysis/reference_data/GCF_000001405.39_GRCh38.p13_genomic.fna\
     --sjdbGTFfile /home/spencer/chipseq-analysis/reference_data/GCF_000001405.39_GRCh38.p13_genomic.gtf\
     --sjdbOverhang 100\
