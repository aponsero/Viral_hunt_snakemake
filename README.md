# Viral_hunt_snakemake
SnakeMake workflow to retrieve viral contigs from bulk metagenomes

## Installation
Create the environment from the environment.yml file:

conda env create -f environment.yml

### VirSorter installation
In order to finish the installation of VirSorter, run

```
conda activate viral_env

cd scripts

git clone https://github.com/simroux/VirSorter.git
cd VirSorter/Scripts
make clean
make

```

### Vibrant installation
In order to download the databases required for Vibrant, run the following:

```
conda activate viral_env
download-db.sh
```

### MARVEL installation
In order to install MARVEL run the following:

```
cd scripts
git clone https://github.com/LaboratorioBioinformatica/MARVEL
cd MARVEL 
python3 download_and_set_models.py
```
           
## notes
Need as an imput assembly (renaming script in pipeline) and bam mapping (but need to be using the renamed contigs)

need to re-save the env configuration (addition metabat2)




