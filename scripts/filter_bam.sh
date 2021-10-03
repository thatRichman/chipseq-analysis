#!/bin/bash
# Adapted from ENCODE chipseq pipeline

# filter bam for quality
# duplicates already removed by STAR
samtools view -F 1804 -q 30 -b $1 -o $2.filtered.bam

# generate index of bam file
samtools index $2.filtered.bam $2.bai

# calculate bam file statistics
samtools sort -n --threads 10 $2.filtered.bam -O SAM | SAMstats --sorted_sam_file - --outf $2.flagstat.qc
