#!/bin/bash
#SBATCH --job-name=a6_download
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=16G
#SBATCH --time=00:15:00
#SBATCH --output=slurm-%x-%j.out
set -euo pipefail
mkdir -p ./data
wget -O ./data/SRR33939694.fastq.gz "https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1"
ls -lh ./data
