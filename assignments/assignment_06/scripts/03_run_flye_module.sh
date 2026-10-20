#!/bin/bash
set -euo pipefail

module load Flye/gcc-11.4.1/2.9.6

OUT=./assemblies/assembly_module
mkdir -p "$OUT"

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --meta \
     --threads 6 \
     --out-dir "$OUT"

mv "$OUT/assembly.fasta" "$OUT/module_assembly.fasta"
mv "$OUT/flye.log"       "$OUT/module_flye.log"
find "$OUT" -mindepth 1 -not -name 'module_assembly.fasta' -not -name 'module_flye.log' -delete
