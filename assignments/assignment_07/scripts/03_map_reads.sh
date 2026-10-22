#!/bin/bash
set -euo pipefail

THREADS=${SLURM_CPUS_PER_TASK:-4}
REF=./data/dog_reference
SUMMARY=./output/dog_read_summary.tsv

# build the bbmap index once (saved in ./data/dog_reference/ref/) and reuse it for every sample
if [ ! -d $REF/ref ]; then
bbmap.sh -Xmx48g ref=$REF/dog_reference_genome.fna path=$REF threads=$THREADS
fi

echo -e "Sample_ID\tTotal_QC_Reads\tDog_Mapped_Reads" > $SUMMARY

for FWD in ./data/clean/*_1.fastq.gz
do
REV=${FWD/_1.fastq.gz/_2.fastq.gz}
ACC=$(basename "$FWD" _1.fastq.gz)

echo "mapping ${ACC}"
bbmap.sh -Xmx48g path=$REF in=$FWD in2=$REV out=./output/${ACC}.bam minid=0.95 threads=$THREADS

# -F 4 drops unmapped reads, keeping only reads that hit the dog genome
samtools view -h -F 4 ./output/${ACC}.bam > ./output/${ACC}_dog-matches.sam

TOTAL=$(samtools view -c ./output/${ACC}.bam)
DOG=$(samtools view -c ./output/${ACC}_dog-matches.sam)
echo -e "${ACC}\t${TOTAL}\t${DOG}" >> $SUMMARY

# the full alignment is huge and almost all non-dog reads, so only the dog matches are kept
rm ./output/${ACC}.bam
done
