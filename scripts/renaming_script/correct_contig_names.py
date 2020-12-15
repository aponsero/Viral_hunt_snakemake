#!/usr/bin/env python3
import os
import argparse
from Bio import SeqIO

def get_args():
  parser = argparse.ArgumentParser(description='corrects contigs name to be unique')
  parser.add_argument('-f', '--contigs', help='contigs file path',
    type=str, metavar='CONTIGS', required=True)
  parser.add_argument('-n', '--name', help='sample name',
    type=str, metavar='NAME', required=True)

  return parser.parse_args()

def main():
    #get arguments
    args = get_args()
    myfile= args.contigs
    myname=args.name
 

    #new output file
    head, tail = os.path.split(myfile)
    outfile = head + "/renamed_"+tail

    # create an iterable to hold the new data
    new_seq = []

    #parse and correct contig names
    for seq_record in SeqIO.parse(myfile, "fasta"):
        new_record_name = myname + "-ContigCoA-" + seq_record.id
        seq_record.id = new_record_name
        seq_record.name = ''
        seq_record.description = ''
        new_seq.append(seq_record)
 
    # write the whole thing out
    SeqIO.write(new_seq, outfile, 'fasta')

if __name__ == "__main__":main()
