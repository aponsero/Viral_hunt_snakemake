VirSorter parameters used :

--> Fasta file mined for viral sequences : test/short2_renamed.fasta
--> Viral database used : 
RefseqABVir (all bacterial and archaeal virus genomes in Refseq, as of January 2014)
--> No custom reference sequence was added to the database
This VirSorter computation finished on Tue Dec 15 09:37:47 2020

---------------------------------------------------------
VirSorter main result file is in this folder : VIRSorter_global_phage_signal.csv
This table (which can be read with any spreadsheet) list all sequences detected as viral 
by VirSorter, organized by category. First, sequences entirely viral, from the more to 
less confident predictions (category 1, 2, and 3), then the prophages (viral regions 
detected in a cellular contig), again from the more to less confident predictions 
(category 4, 5, and 6). 
For each sequence is indicated the number of genes predicted, number of viral hallmark genes,
and significance score for viral gene enrichment, non-caudovirales gene enrichment, pfam depletion, 
Uncharacterized gene enrichment, Strand switch depletion, and Short gene enrichment.
Fasta and genbank files of all predicted sequences gathered by category are automatically 
generated and put in folder Predicted_viral_sequences/.


The other folders content are as follows :
Fasta_files/ contains input sequences pre-processed by Metavir including gene prediction
logs/ contains all logs
r_X/ folders contain the succesive databases generated. r_0/ is the first revision and 
corresponds to the database asked by the user (RefseqABVir or Viromes, potentially complemented 
by custom viral sequences). r_1 and later correspond to databases generated from the previous run 
prediction (all viral sequences of category 1 from revision n-1 are included in a database used to 
mine the input dataset in revision n). 
Metrics_files/ contains intermediary files used by VirSorter to summarize metrics on each sequence
Tab_files/ contains the raw results from hmm and BLAST search of databases.

---------------------------------------------------------


