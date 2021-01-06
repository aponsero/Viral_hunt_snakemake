
#activate environment
conda activate viral_env

#dry run
snakemake -n

# run on cluster
-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE
snakemake --cluster "qsub -q {cluster.queue} -W group_list={cluster.group} -M {cluster.M} -m -M {cluster.m} -l {cluster.walltime} -l {cluster.select}" --cluster-config config/cluster.yaml -j 3

snakemake --cluster "qsub -N test_snake -W group_list=bhurwitz -q standard -l walltime=02:00:00 -l select=1:ncpus=12:mem=100gb" -j 10


snakemake --cluster "qsub -q {cluster.queue} -M {cluster.M} -A {cluster.A} -m {cluster.m} -o {cluster.o} -e {cluster.e} -r {cluster.r}" --cluster-config config/cluster.yaml -j 32
