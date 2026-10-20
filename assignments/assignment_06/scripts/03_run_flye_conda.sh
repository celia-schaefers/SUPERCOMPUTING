#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

OUT=./assemblies/assembly_conda
mkdir -p "$OUT"

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --meta \
     --threads 6 \
     --out-dir "$OUT"

mv "$OUT/assembly.fasta" "$OUT/conda_assembly.fasta"
mv "$OUT/flye.log"       "$OUT/conda_flye.log"
find "$OUT" -mindepth 1 -not -name 'conda_assembly.fasta' -not -name 'conda_flye.log' -delete

conda deactivate
