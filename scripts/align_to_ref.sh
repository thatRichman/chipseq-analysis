#!/bin/bash

for file in $(find $1 -name '*.fastq*'); do
	echo "aligning $file"
	
	if [[ $file =~ \.t?gz$ ]]; then
		readFilesCommand="--readFilesCommand zcat"
		pref=$(basename $file .fastq.gz)
	else
		readFilesCommand=""
		pref=$(basename $file .fastq)
	fi
	
	cmd="
		STAR --runThreadN 10\
		--genomeDir /mnt/e/hg38_index\
		--outSAMtype BAM SortedByCoordinate\
		--outFileNamePrefix /home/spencer/chipseq-analysis/aligned_data/$pref\
		--readFilesIn $file\
		--outFilterMultimapNmax 1\
	     "
	eval " $cmd$readFilesCommand"

done
