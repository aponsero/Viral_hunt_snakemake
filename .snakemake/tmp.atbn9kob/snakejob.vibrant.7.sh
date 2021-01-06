#!/bin/sh
# properties = {"type": "single", "rule": "vibrant", "local": false, "input": ["test/SAMEA4817893_renamed.fasta"], "output": ["results/Vibrant/SAMEA4817893_renamed/VIBRANT_SAMEA4817893_renamed/VIBRANT_log_SAMEA4817893_renamed.log"], "wildcards": {"base": "SAMEA4817893"}, "params": {"outdir": "results/Vibrant/SAMEA4817893_renamed"}, "log": [], "threads": 1, "resources": {}, "jobid": 7, "cluster": {"queue": "standard", "group": "aponsero", "M": "aponsero@email.arizona.edu", "walltime": "walltime=06:00:00", "select": "select=1:ncpus=12:mem=100gb", "m": "bea", "o": "out/vibrant.base=SAMEA4817893.out", "e": "err/vibrant.base=SAMEA4817893.err"}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake results/Vibrant/SAMEA4817893_renamed/VIBRANT_SAMEA4817893_renamed/VIBRANT_log_SAMEA4817893_renamed.log --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.atbn9kob test/SAMEA4817893_renamed.fasta --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules vibrant --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.atbn9kob/7.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.atbn9kob/7.jobfailed; exit 1)

