#!/bin/bash
set -euo pipefail
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -y -n flye-env -c conda-forge -c bioconda flye=2.9.6

conda activate flye-env
flye -v                                   # check which version you got
conda env export --no-builds > ./flye-env.yml
conda deactivate
