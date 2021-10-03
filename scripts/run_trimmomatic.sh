#!/bin/bash

java -jar /home/spencer/chipseq-analysis/Trimmomatic/dist/jar/trimmomatic-0.40-rc1.jar\
	SE -phred33 $1 $2 \
	ILLUMINACLIP:/home/spencer/chipseq-analysis/Trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:30
