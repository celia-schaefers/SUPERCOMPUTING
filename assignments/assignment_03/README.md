# Assignment 3
Celia Schaefers, 9/16/2026, assignment 3

## Assignment Tasks
Task 1. Navigate to your assignment_3/ directory and set it up

Create it if not already present. Go ahead and create directories for all assignments (N=8) if not already present.

Go ahead and build out your directory structure within assignment_3/
(./README.md & ./data/)
_____________________________________________________________________
Task 2: Download a fasta sequence file using wget

Download the following file into your assignment_3/data/ directory:

https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz

Uncompress it using gunzip

This is a full genome assembly for A. thalliana.
_____________________________________________________________________
Task 3: Use Unix tools to explore the file contents

Using only the Unix tools introduced in class, manually develop and run a series of commands to answer the following:
1. How many sequences are in the FASTA file? (answer=7)
2. What is the total number of nucleotides (not including header lines or newlines)? (answer=119,668,634)
3. How many total lines are in the file? (answer=14)
4. How many header lines contain the word "mitochondrion"? (answer=1)
5. How many header lines contain the word "chromosome"? (answer=5)
6. How many nucleotides are in each of the first 3 chromosome sequences? (answer=30,427,672   19,698,290  23,459,831)
7. How many nucleotides are in the sequence for 'chromosome 5'? (answer=26,975,503)
8. How many sequences contain "AAAAAAAAAAAAAAAA"? (answer=1)
9. If you were to sort the sequences alphabetically, which sequence (header) would be first in that list? (answer=>NC_000932.1...)
10. How would you make a new tab-separated version of this file, where the first column is the headers and the second column are the associated sequences? (show the command(s))
>NC_003070.9 Arabidopsis thaliana chromosome 1 sequence    ccctaaaccctaaaccctaaaccctaaacctctG...
>NC_003071.7 Arabidopsis thaliana chromosome 2, partial sequence    NNNNNNNNNNNNNNNNNNNNNNN...
      ... etc.
_____________________________________________________________________
Task 4: Document Everything in README.md

You really should be doing this as you go; once you get a command that does what you want, record it.

ALL commands, including any required cd calls, should be in here.

I should be able to go into your assignment_3/ directory, run your commands in README.md for each question (from there!) and get the right answer.
_____________________________________________________________________
Task 5: Write a reflection in your README.md

After all of your documentation for doing the assignment, at the bottom of your README.md file, write up a 300–600 word reflection on:
- Your approach and what you learned
- Any command-line tools that surprised or frustrated you
- Why these kinds of skills are essential in computational work
- (Optional) How your solution could be automated in the future

## Directory Structure
```
└── assignment_03/
	├── data/
		├── GCF_000001735.4_TAIR10.1_genomic.fna
	└── README.md
```

## Commands used

cd data/

grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l

grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d '\n' | wc -c

wc -l GCF_000001735.4_TAIR10.1_genomic.fna

grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep "mitochondrion" | wc -l

grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep "chromosome" | wc -l

- head -2 GCF_000001735.4_TAIR10.1_genomic.fna | grep -v "^>" | wc -c
- head -4 GCF_000001735.4_TAIR10.1_genomic.fna | tail -2 | grep -v "^>" | wc -c
- head -6 GCF_000001735.4_TAIR10.1_genomic.fna | tail -2 | grep -v "^>" | wc -c

grep -A 1 'chromosome 5' GCF_000001735.4_TAIR10.1_genomic.fna | tail -1 | wc -c

grep -c 'AAAAAAAAAAAAAAAA' GCF_000001735.4_TAIR10.1_genomic.fna

grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -1

- grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna >> headers_GCF_000001735.4_TAIR10.1_genomic
- grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna >> sequences_GCF_000001735.4_TAIR10.1_genomic.fna                                      170 [bora] head -3 headers_GCF_000001735.4_TAIR10.1_genomic
- paste headers_GCF_000001735.4_TAIR10.1_genomic sequences_GCF_000001735.4_TAIR10.1_genomic.fna > columns_GCF_000001735.4_TAIR10.1_genomic.fna
