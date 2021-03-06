#!/bin/sh
# properties = {"type": "single", "rule": "virfinder", "local": false, "input": ["test/megahitCoassembly_SAMEA4817925_renamed.fasta", "scripts/VirFinder/eval_default.r"], "output": ["results/VirFinder/megahitCoassembly_SAMEA4817925.txt"], "wildcards": {"base": "megahitCoassembly_SAMEA4817925"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 5, "cluster": {"queue": "standard", "group": "aponsero", "M": "aponsero@email.arizona.edu", "walltime": "walltime=06:00:00", "select": "select=1:ncpus=12:mem=100gb", "m": "bea", "o": "out/virfinder.base=megahitCoassembly_SAMEA4817925.out", "e": "err/virfinder.base=megahitCoassembly_SAMEA4817925.err"}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake results/VirFinder/megahitCoassembly_SAMEA4817925.txt --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.zs2welkx test/megahitCoassembly_SAMEA4817925_renamed.fasta scripts/VirFinder/eval_default.r --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules virfinder --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.zs2welkx/5.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.zs2welkx/5.jobfailed; exit 1)

