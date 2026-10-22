#!/bin/bash
set -euo pipefail

METADATA=${1:-./data/SraRunTable.csv}
THREADS=${SLURM_CPUS_PER_TASK:-4}

mkdir -p ./data/raw ./data/dog_reference

# first column is "Run"; skip the header and strip quotes/Windows line endings
for ACC in $(tail -n +2 "$METADATA" | cut -d, -f1 | tr -d '"\r')
do
echo "downloading ${ACC}"
fasterq-dump "$ACC" --threads "$THREADS" --outdir ./data/raw
pigz -f -p "$THREADS" ./data/raw/${ACC}*.fastq
done

# reference genome only (RefSeq), unzipped and renamed
cd ./data/dog_reference
datasets download genome taxon "Canis lupus familiaris" --reference --assembly-source RefSeq --include genome --filename dog_genome.zip
unzip -o dog_genome.zip -d tmp
mv tmp/ncbi_dataset/data/*/*.fna dog_reference_genome.fna
rm -rf tmp dog_genome.zip
