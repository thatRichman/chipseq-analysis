#!/bin/bash
# adapted from ENCODE pipeline
# run this on NOT deduplicated file
bedtools bamtobed -i $1 | \
	awk 'BEGIN{OFS="\t"}{print $1,$2,$3,$6}' | \
	grep -v 'chrM' |\
	sort |\
	uniq -c |\
 	awk 'BEGIN{mt=0;m0=0;m1=0;m2=0} ($1==1){m1=m1+1} ($1==2){m2=m2+1} {m0=m0+1} {mt=mt+$1} END{printf "%d\t%d\t%d\t%d\t%f\t%f\t%f\n",mt,m0,m1,m2,m0/mt,m1/m0,m1/m2}' > ${PBC_FILE_QC}
