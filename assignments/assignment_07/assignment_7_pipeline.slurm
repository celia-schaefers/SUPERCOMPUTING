#!/bin/bash
#SBATCH --job-name=assignment_7
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=2-00:00:00
#SBATCH --output=output/assignment_7.out
#SBATCH --error=output/assignment_7.err
#SBATCH --mail-type=END,FAIL

# submit from inside assignment_07
set -eo pipefail

./scripts/00_setup_env.sh

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate a7-dogdna

./scripts/01_download_data.sh
./scripts/02_clean_reads.sh
./scripts/03_map_reads.sh
