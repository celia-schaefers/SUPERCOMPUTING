#!/bin/bash
set -euo pipefail

# downloads and extracts the fastq files into ./data/raw
./scripts/01_download_data.sh


# quality-trim every paired-end sample with fastp through script 02, loops through just forward files, reverse is derived
for FWD in data/raw/*_R1_*.fastq.gz
do
echo ${FWD}
./scripts/02_run_fastp.sh ${FWD}
done

