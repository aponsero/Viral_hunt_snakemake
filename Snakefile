SAMPLES = ["short1", "short2"]

rule all:
    input:
        expand("results/VirSorter/{sample}/VIRSorter_global-phage-signal.csv", sample=SAMPLES),
        expand("results/VirFinder/{sample}.txt", sample=SAMPLES),
        expand("results/Vibrant/VIBRANT_{sample}_renamed/VIBRANT_log_{sample}_renamed.log", sample=SAMPLES),

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

rule virbrant:
    input:
        f="test/{base}_renamed.fasta",
    params:
        outdir="results/Vibrant",
    output:
        "results/Vibrant/VIBRANT_{base}_renamed/VIBRANT_log_{base}_renamed.log",
    shell:
        """
        cd {params.outdir}
        VIBRANT_run.py -i ../../{input.f}
        cd ../..
        """




