configfile: "config/config.yml"

rule all:
    input:
        expand("results/VirSorter/{sample}/VIRSorter_global-phage-signal.csv", sample=config["samples"]),
        expand("results/VirFinder/{sample}.txt", sample=config["samples"]),
        expand("results/Vibrant/{sample}_renamed/VIBRANT_{sample}_renamed/VIBRANT_log_{sample}_renamed.log", sample=config["samples"]),
        expand("test/{sample}_DEPTH.txt", sample=config["samples"]),
        expand("results/marvel/{sample}_bin/results/phage_bins/list_bins.txt", sample=config["samples"]),
        expand("results/viral_sequences/prophages/{sample}_prophages_selection1.fna", sample=config["samples"]),
        expand("results/viral_sequences/phages/{sample}_phages_selection1.fna", sample=config["samples"]),



##### workflow starts here
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

rule metabat:
    input:
        f="test/{base}_renamed.fasta",
        bam="test/{base}.bam"
    params:
        bin_dir="results/marvel/{base}_bin",
    output:
        "test/{base}_DEPTH.txt",
    shell:
        """
        set +eu
        source activate viral_env
        mkdir -p {params.bin_dir}
        jgi_summarize_bam_contig_depths --outputDepth {output} {input.bam}
        metabat2 -i {input.f} -a {output} -m 1500 -s 10000 -o {params.bin_dir}/bin
        """


rule marvel:
    input:
        f="test/{base}_DEPTH.txt",
    params:
        marvel_script="scripts/MARVEL",
        bin_dir="results/marvel/{base}_bin",
    output:
        "results/marvel/{base}_bin/results/phage_bins/list_bins.txt"
    shell:
        """
        set +eu
        source activate viral_env
        cd {params.marvel_script}
        python3 marvel_bins.py -i ../../{params.bin_dir} -t 28
        cd ../.. 
        find {params.bin_dir}/results/phage_bins -name "*.fasta" >> {output}
        """

rule prophage:
    input:
        f_marvel="results/marvel/{base}_bin/results/phage_bins/list_bins.txt",
        f_virsorter="results/VirSorter/{base}/VIRSorter_global-phage-signal.csv",
        f_virfinder="results/VirFinder/{base}.txt",
        f_vibrant="results/Vibrant/{base}_renamed/VIBRANT_{base}_renamed/VIBRANT_log_{base}_renamed.log",
    params:
        prophage_script="scripts/parsing_results/get_prophages.sh",
        output_dir="results/viral_sequences/prophages",
        sample_name="{base}",
    output:
        "results/viral_sequences/prophages/{base}_prophages_selection1.fna"
    shell:
        """
        mkdir -p {params.output_dir}
        bash {params.prophage_script} {params.sample_name} {params.output_dir} 
        """



rule phage:
    input:
        f_marvel="results/marvel/{base}_bin/results/phage_bins/list_bins.txt",
        f_virsorter="results/VirSorter/{base}/VIRSorter_global-phage-signal.csv",
        f_virfinder="results/VirFinder/{base}.txt",
        f_vibrant="results/Vibrant/{base}_renamed/VIBRANT_{base}_renamed/VIBRANT_log_{base}_renamed.log",
    params:
        phage_script="scripts/parsing_results/get_viral_sequences.sh",
        output_dir="results/viral_sequences/phages",
        sample_name="{base}",
    output:
        "results/viral_sequences/phages/{base}_phages_selection1.fna"
    shell:
        """
        mkdir -p {params.output_dir}
        bash {params.phage_script} {params.sample_name} {params.output_dir}
        """




