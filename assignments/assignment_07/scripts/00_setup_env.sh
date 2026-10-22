#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

ENV=a7-dogdna

if conda env list | grep -q "^${ENV} "; then
echo "${ENV} already exists, skipping install"
else
conda create -y -n "$ENV" -c conda-forge -c bioconda sra-tools ncbi-datasets-cli fastp bbmap samtools pigz
fi