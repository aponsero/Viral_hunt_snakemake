#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=10gb
#PBS -l walltime=24:00:00
#PBS -M aponsero@email.arizona.edu
#PBS -m bea
#PBS -l place=pack:shared


SAMPLE_LIST="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/fastq/Biosample.txt"

OUT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/potential_viral/non_prophage_dir"


##############################################
# virSorter parsing

while read SAMPLE; do
    VIRSORTER_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/VirSorter/megahitCoassembly_${SAMPLE}.fa"

    VIRSORTER="$VIRSORTER_DIR/Predicted_viral_sequences"

    cd $VIRSORTER

# remove potential previous files
    if [[ -f "${SAMPLE}_virsorter.fasta" ]]; then
        rm "${SAMPLE}_virsorter.fasta"
    fi

    if [[ -f "${SAMPLE}_list_VirSorter.txt" ]]; then
        rm "list_VirSorter.txt"
    fi

    if [[ -f "map_names.txt" ]]; then
        rm "map_names.txt"
    fi

# get viral sequences names
    cat VIRSorter_cat-1.fasta VIRSorter_cat-2.fasta VIRSorter_cat-3.fasta > ${SAMPLE}_virsorter.fasta

    grep ">" ${SAMPLE}_virsorter.fasta > list_a.txt
    sed 's/>//' list_a.txt > list.txt
    sed 's/VIRSorter_//' list.txt > list_b.txt
    sed 's/-circular.*$//' list_b.txt > list_c.txt
    sed 's/-cat_.*$//' list_c.txt > ${SAMPLE}_list_VirSorter.txt
    paste list.txt ${SAMPLE}_list_VirSorter.txt > map_names.txt

    rm list.txt
    rm list_c.txt
    rm list_b.txt
    rm list_a.txt

    cp ${SAMPLE}_list_VirSorter.txt $OUT_DIR

done <$SAMPLE_LIST

###############################################################
# vibrant parsing

while read SAMPLE; do
# get Vibrant prophages names
    VIBRANT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/Vibrant/megahitCoassembly_${SAMPLE}.fa"

    VIBRANT="$VIBRANT_DIR/VIBRANT_megahitCoassembly_${SAMPLE}/VIBRANT_phages_megahitCoassembly_${SAMPLE}"

    cd $VIBRANT

# remove previous run files
    if [[ -f "${SAMPLE}_vibrant.fasta" ]]; then
        rm "${SAMPLE}_vibrant.fasta"
    fi

    if [[ -f "${SAMPLE}_list_Vibrant.txt" ]]; then
        rm "${SAMPLE}_list_Vibrant.txt"
    fi

    grep -v "_fragment_" megahitCoassembly_${SAMPLE}.phages_combined.txt > ${SAMPLE}_list_Vibrant.txt 

    cp ${SAMPLE}_list_Vibrant.txt $OUT_DIR

done <$SAMPLE_LIST

###############################################################
# MARVEL parsing

while read SAMPLE; do
# get MARVEL names
    MARVEL_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/MARVEL"
    MARVEL="$MARVEL_DIR/${SAMPLE}_bin/results/phage_bins"

    if [[ ! -d "$MARVEL_DIR/${SAMPLE}_bin/results/phage_bins" ]]; then
        echo "no phages found for ${SAMPLE}"

    else

        cd $MARVEL

# remove previous run files
        if [[ -f "${SAMPLE}_marvel.fasta" ]]; then
            rm "${SAMPLE}_marvel.fasta"
        fi

        if [[ -f "${SAMPLE}_list_marvel.txt" ]]; then
            rm "${SAMPLE}_list_marvel.txt"
        fi

        cat bin.* > ${SAMPLE}_marvel.fasta 
        grep ">" ${SAMPLE}_marvel.fasta > list_marvel.txt
        sed 's/>//' list_marvel.txt > ${SAMPLE}_list_marvel.txt

        rm list_marvel.txt 

        cp ${SAMPLE}_list_marvel.txt $OUT_DIR
    fi
done <$SAMPLE_LIST



###############################################################
# VirFinder parsing
# Need to add this parsing step while running VirFinder

while read SAMPLE; do
# get VirFinder names
    VIRFINDER_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/VirFinder"

    cd $VIRFINDER_DIR

# remove previous run files

    if [[ -f "${SAMPLE}_list_virFinder.txt" ]]; then
        rm "${SAMPLE}_list_virFinder.txt"
    fi

    awk '{ if (($4 >= 0.960) && ($3 >= 1000)) { print $2 } }' megahitCoassembly_${SAMPLE}.fasta.txt | sed 's/"//g' > ${SAMPLE}_list_virFinder.txt

    cp ${SAMPLE}_list_virFinder.txt $OUT_DIR

done <$SAMPLE_LIST

###############################################################
# merge viral sequences

cd $OUT_DIR

while read SAMPLE; do
    cat ${SAMPLE}_list_* > ${SAMPLE}_merge.txt
    sort ${SAMPLE}_merge.txt | uniq > ${SAMPLE}_unique.txt 

done <$SAMPLE_LIST


cat *_unique.txt > selection1.txt

###############################################################
# retrieve lytic sequences

CONT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/assembly_patient/renamed_contigs"
SPLIT_DIR="/xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/Jess/dataset_CRC/PRJEB27928_Wirbel/Viral_hunt/potential_viral"
LIST_SPLIT="$SPLIT_DIR/list_split.txt"

cd $CONT_DIR

s=`head -n +${PBS_ARRAY_INDEX} $LIST_SPLIT | tail -n 1`
split="$SPLIT_DIR/$s"
out="$SPLIT_DIR/${s}.fasta"
echo $split

while IFS=, read -r contig_id file_id stuff
do 
    echo "$contig_id in $file_id"
    file="singleline_$file_id"
    grep -A1 -w $contig_id $file >> $out
done < $split








