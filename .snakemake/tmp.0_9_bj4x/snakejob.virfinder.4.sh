#!/bin/sh
# properties = {"type": "single", "rule": "virfinder", "local": false, "input": ["test/megahitCoassembly_SAMEA4817893_renamed.fasta", "scripts/VirFinder/eval_default.r"], "output": ["results/VirFinder/megahitCoassembly_SAMEA4817893.txt"], "wildcards": {"base": "megahitCoassembly_SAMEA4817893"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 4, "cluster": {}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake results/VirFinder/megahitCoassembly_SAMEA4817893.txt --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.0_9_bj4x test/megahitCoassembly_SAMEA4817893_renamed.fasta scripts/VirFinder/eval_default.r --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules virfinder --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.0_9_bj4x/4.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.0_9_bj4x/4.jobfailed; exit 1)

