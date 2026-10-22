#!/bin/bash
set -euo pipefail

THREADS=${SLURM_CPUS_PER_TASK:-4}
mkdir -p ./data/clean

# loop through forward reads only; reverse and output names are built from it
for FWD_IN in ./data/raw/*_1.fastq.gz
do
REV_IN=${FWD_IN/_1.fastq.gz/_2.fastq.gz}
FWD_OUT=${FWD_IN/raw/clean}
REV_OUT=${REV_IN/raw/clean}
ACC=$(basename "$FWD_IN" _1.fastq.gz)

echo "cleaning ${ACC}"
fastp --in1 "$FWD_IN" --in2 "$REV_IN" --out1 "$FWD_OUT" --out2 "$REV_OUT" \
      --json /dev/null --html ./output/${ACC}_fastp.html --thread "$THREADS" \
      --detect_adapter_for_pe --cut_front --cut_tail --cut_mean_quality 20 --length_required 50 --n_base_limit 5
done
