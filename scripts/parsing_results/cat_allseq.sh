

# cat prophages
cat *.fasta > all_prophages_collected.fna

awk '{
if (/>/)
 print $0 "_" ++count;
else
 print $0;
}' all_prophages_collected.fna > all_prophages_selection1.fna

rm all_prophages_collected.fna
