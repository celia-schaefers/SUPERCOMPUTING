#!/bin/bash
set -ueo pipefail 

FASTA_FILE=$1

SEQTK_OUT="$(seqtk size "$FASTA_FILE")"

SEQ_NUM="$(cut -f1 <<< "$SEQTK_OUT")"

NUC_NUM="$(cut -f2 <<< "$SEQTK_OUT")"

TABLE="$(paste <(grep "^>" $FASTA_FILE) <(grep -v "^>" $FASTA_FILE))"

echo "There are $SEQ_NUM sequences in the file: $FASTA_FILE"

echo "There are $NUC_NUM nucleotides in the file: $FASTA_FILE"

echo "Here are the lines of $FASTA_FILE:"

echo "$TABLE"

