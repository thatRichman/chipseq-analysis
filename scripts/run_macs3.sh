#!/bin/bash

macs3 callpeak  -t $1 \
		-c $2 \
		-f BAM -g 1.3e+8\
		-n $3 \
		--nomodel\
		--extsize 147
		--outdir /home/spencer/chipseq-analysis/macs3 2> /home/spencer/chipseq-analysis/macs3/$3-macs3.log
