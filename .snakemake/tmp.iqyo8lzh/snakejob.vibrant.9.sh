#!/bin/sh
# properties = {"type": "single", "rule": "vibrant", "local": false, "input": ["test/megahitCoassembly_SAMEA4817951_renamed.fasta"], "output": ["results/Vibrant/megahitCoassembly_SAMEA4817951_renamed/VIBRANT_megahitCoassembly_SAMEA4817951_renamed/VIBRANT_log_megahitCoassembly_SAMEA4817951_renamed.log"], "wildcards": {"base": "megahitCoassembly_SAMEA4817951"}, "params": {"outdir": "results/Vibrant/megahitCoassembly_SAMEA4817951_renamed"}, "log": [], "threads": 1, "resources": {}, "jobid": 9, "cluster": {"queue": "standard", "group": "aponsero", "M": "aponsero@email.arizona.edu", "walltime": "walltime=06:00:00", "select": "select=1:ncpus=12:mem=100gb", "m": "bea", "o": "out/vibrant.base=megahitCoassembly_SAMEA4817951.out", "e": "err/vibrant.base=megahitCoassembly_SAMEA4817951.err"}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake results/Vibrant/megahitCoassembly_SAMEA4817951_renamed/VIBRANT_megahitCoassembly_SAMEA4817951_renamed/VIBRANT_log_megahitCoassembly_SAMEA4817951_renamed.log --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.iqyo8lzh test/megahitCoassembly_SAMEA4817951_renamed.fasta --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules vibrant --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.iqyo8lzh/9.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.iqyo8lzh/9.jobfailed; exit 1)

