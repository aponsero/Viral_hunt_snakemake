

rule all:
    input:
        "test/VirSorter/renamed_file1.fasta/VIRSorter_global-phage-signal.csv"

rule rename:
    input:
        f="test/{sample}.fasta",
        scr="scripts/renaming_script/correct_contig_names.py",
    output:
        "test/renamed_{sample}.fasta",
    shell:
        "python {input.scr} -f {input.f} -n mytest"

rule virsorter:
    input:
        f="test/renamed_{sample}.fasta",
        scr="scripts/VirSorter/wrapper_phage_contigs_sorter_iPlant.pl",
    params:
        outdir= "test/VirSorter",
        datadir= "/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/virsorter-data",
    output:
        "test/VirSorter/renamed_{sample}.fasta/VIRSorter_global-phage-signal.csv"
    shell:
        "mkdir {params.outdir}"
        "{input.scr} -f {input.f} --db 1 --wdir {params.outdir} --ncpu 20 --data-dir {params.datadir}" 
