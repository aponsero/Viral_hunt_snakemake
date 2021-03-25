#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=10gb
#PBS -l walltime=12:00:00
#PBS -M aponsero@email.arizona.edu
#PBS -m bea

cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_hunt_snakemake

RES="results"
OUT="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB12449_Vogtmann/viral_hunt"

#cp -r $RES $OUT

rm -r $RES
rm -r test

