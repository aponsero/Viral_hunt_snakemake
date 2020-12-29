
#activate environment
conda activate viral_env

#dry run
snakemake -n

# run on cluster
snakemake --cluster "qsub -l {cluster.l} -M {cluster.M} -A {cluster.A} -m {cluster.m} -o {cluster.o} -e {cluster.e} -r {cluster.r}" --cluster-config config/cluster.yaml -j 32
