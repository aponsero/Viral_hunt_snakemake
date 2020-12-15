SAMPLES = ["short1", "short2"]

rule all:
    input:
        expand("results/VirSorter/{sample}/VIRSorter_global-phage-signal.csv", sample=SAMPLES),

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





