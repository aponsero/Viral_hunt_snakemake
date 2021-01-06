#!/bin/sh
# properties = {"type": "single", "rule": "virsorter", "local": false, "input": ["test/megahitCoassembly_SAMEA4817951_renamed.fasta", "scripts/VirSorter/wrapper_phage_contigs_sorter_iPlant.pl"], "output": ["results/VirSorter/megahitCoassembly_SAMEA4817951/VIRSorter_global-phage-signal.csv"], "wildcards": {"base": "megahitCoassembly_SAMEA4817951"}, "params": {"outdir": "results/VirSorter/megahitCoassembly_SAMEA4817951", "datadir": "/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/virsorter-data"}, "log": [], "threads": 1, "resources": {}, "jobid": 3, "cluster": {"queue": "standard", "group": "aponsero", "M": "aponsero@email.arizona.edu", "walltime": "walltime=06:00:00", "select": "select=1:ncpus=12:mem=100gb", "m": "bea", "o": "out/virsorter.base=megahitCoassembly_SAMEA4817951.out", "e": "err/virsorter.base=megahitCoassembly_SAMEA4817951.err"}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake results/VirSorter/megahitCoassembly_SAMEA4817951/VIRSorter_global-phage-signal.csv --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.t2a11h05 test/megahitCoassembly_SAMEA4817951_renamed.fasta scripts/VirSorter/wrapper_phage_contigs_sorter_iPlant.pl --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules virsorter --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.t2a11h05/3.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.t2a11h05/3.jobfailed; exit 1)

