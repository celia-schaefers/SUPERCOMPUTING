#!/bin/bash
set -euo pipefail

export PATH="$HOME/programs/Flye/bin:$PATH"

OUT=./assemblies/assembly_local
mkdir -p "$OUT"

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --meta \
     --threads 6 \
     --out-dir "$OUT"

mv "$OUT/assembly.fasta" "$OUT/local_assembly.fasta"
mv "$OUT/flye.log"       "$OUT/local_flye.log"
find "$OUT" -mindepth 1 -not -name 'local_assembly.fasta' -not -name 'local_flye.log' -delete
