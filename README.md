# Viral_hunt_snakemake
SnakeMake workflow to retrieve viral contigs from bulk metagenomes

## Installation
Create the environment from the environment.yml file:

conda env create -f environment.yml



to do install--> VirSorter: download-db.sh and put scripts in scripts folder
            --> install VirFinder in R
            --> Vibrant: run the download-db.sh script
            --> install marvel in script folder (git clone https://github.com/LaboratorioBioinformatica/MARVEL + python3 download_and_set_models.py)

## notes
Need as an imput assembly (renaming script in pipeline) and bam mapping (but need to be using the renamed contigs)

need to re-save the env configuration (addition metabat2)




