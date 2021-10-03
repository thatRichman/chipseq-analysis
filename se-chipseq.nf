nextflow.enable.dsl=2

process trimGalore {
    input:
    path(fastq)
    
    output:
    path("${fastq.simpleName}_trimmed.fq.gz"), emit: trimmed_fastq
    path("${fastq}_trimming_report.txt"), emit: trim_report
    path("*.html"), emit: trim_html_report
    path("*.zip"), emit: trim_zip
    
    """
    $params.trimGalore.trimGalorePath \
    --fastqc $fastq \
    --cores $params.trimGalore.nThread
    """

}

process alignSTAR {
    input:
    path fastq

    output:
    path '*coord.bam', emit: sorted_bam
    path '*Log.final.out', emit: final_log
    path '*Log.out', emit: log
    path '*Log.progress.out', emit: progress_log
    
    script:
    def is_compressed = fastq.extension == "gz" ? "--readFilesCommand zcat" : "" 
    """
    $params.star.starPath \
    --runThreadN $params.star.nThread \
    --genomeDir $params.genomeDir \
    --outSAMtype BAM SortedByCoordinate \
    --readFilesIn $fastq \
    --outFilterMultimapNmax 1 \
    $is_compressed
    """

}
 
workflow {
    fastq_ch = Channel.fromPath("${projectDir}/raw_data/*.fastq.gz")
    trimGalore(fastq_ch)
    alignSTAR(trimGalore.out.trimmed_fastq)
}
