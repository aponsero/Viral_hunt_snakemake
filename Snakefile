configfile: "config/config.yml"

rule all:
    input:
        expand("results/VirSorter/{sample}/VIRSorter_global-phage-signal.csv", sample=config["samples"]),
        expand("results/VirFinder/{sample}.txt", sample=config["samples"]),
        expand("results/Vibrant/{sample}_renamed/VIBRANT_{sample}_renamed/VIBRANT_log_{sample}_renamed.log", sample=config["samples"]),

rule rename:
    input:
        f="test/{base}.fasta",
        scr="scripts/renaming_script/correct_contig_names.py",
    output:
        "test/{base}_renamed.fasta",
    shell:
        "python {input.scr} -f {input.f}"


rule virsorter:
    input:
        f="test/{base}_renamed.fasta",
        scr="scripts/VirSorter/wrapper_phage_contigs_sorter_iPlant.pl",
    params:
        outdir= "results/VirSorter/{base}",
        datadir= "/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/virsorter-data",
    output:
        "results/VirSorter/{base}/VIRSorter_global-phage-signal.csv",
    shell:
        """
        set +eu
        source activate viral_env
        module load perl
        {input.scr} -f {input.f} --db 1 --wdir {params.outdir} --ncpu 20 --data-dir {params.datadir}
        """

rule virfinder:
    input:
        f="test/{base}_renamed.fasta",
        scr="scripts/VirFinder/eval_default.r",
    output:
        "results/VirFinder/{base}.txt",
    shell:
        """
        module load R
        Rscript {input.scr} {input.f} {output}
        """

rule vibrant:
    input:
        f="test/{base}_renamed.fasta",
    params:
        outdir="results/Vibrant/{base}_renamed",
    output:
        "results/Vibrant/{base}_renamed/VIBRANT_{base}_renamed/VIBRANT_log_{base}_renamed.log",
    shell:
        """
        set +eu
        source activate viral_env
        cd {params.outdir}
        VIBRANT_run.py -i ../../../{input.f}
        cd ../../..
        """

rule bowtie2:
    input:
        f="test/{base}_renamed.fasta",
        R1="test/{base}_R1.fq",
        R2="test/{base}_R2.fq",
    params:
        db="results/marvel/{base}",
        sam="test/{base}.sam",
    output:
        "test/{base}.bam"
    shell:
        """
        bowtie2-build {input.f} {params.db}
        bowtie2 -x {db} -1 {input.R1} -2 {input.R2} -S {params.sam}
        samtools view -S -b {params.sam} > {output}
        """

rule metabat:
    input:
        f="test/{base}_renamed.fasta",
        bam="test/{base}.bam"
    params:
        bin_dir="results/marvel/{base}_bin/bin",
    output:
        "test/{base}_DEPTH.txt"
    shell:
        """
        jgi_summarize_bam_contig_depths --outputDepth {output} {input.bam}
        metabat2 -i {{input.f} -a {output} -m 1500 -s 10000 -o {params.bin_dir}
        """

