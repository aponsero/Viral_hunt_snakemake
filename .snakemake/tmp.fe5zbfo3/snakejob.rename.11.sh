#!/bin/sh
# properties = {"type": "single", "rule": "rename", "local": false, "input": ["test/megahitCoassembly_SAMEA4817925.fasta", "scripts/renaming_script/correct_contig_names.py"], "output": ["test/megahitCoassembly_SAMEA4817925_renamed.fasta"], "wildcards": {"base": "megahitCoassembly_SAMEA4817925"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 11, "cluster": {"queue": "mangi", "A": "spectorl", "M": "pmonnaha@umn.edu", "walltime": "04:00:00", "mem": "8000mb", "m": "a", "r": "n", "o": "OandE/rename.base=megahitCoassembly_SAMEA4817925.out", "e": "OandE/rename.base=megahitCoassembly_SAMEA4817925.err"}}
 cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake && \
/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/tools/Miniconda3/envs/viral_env/bin/python3.7 \
-m snakemake test/megahitCoassembly_SAMEA4817925_renamed.fasta --snakefile /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.fe5zbfo3 test/megahitCoassembly_SAMEA4817925.fasta scripts/renaming_script/correct_contig_names.py --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules rename --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.fe5zbfo3/11.jobfinished || (touch /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake/.snakemake/tmp.fe5zbfo3/11.jobfailed; exit 1)

