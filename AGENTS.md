# Agent Guidelines

This repository lives on the William & Mary HPC (bora / SciClone). Follow these rules when working here.

## Conda

- **Never run `conda init`.** It modifies shell startup files and breaks other environments.
- Load conda through the module system instead:

  ```bash
  module load miniforge3
  source "$(conda info --base)/etc/profile.d/conda.sh"
  ```

## Login node

- **Never run anything on the login node that takes more than 30 seconds or uses more than a single core.**
- Quick inspection (reading files, `ls`, `head`, `git`) is fine.
- Downloads, builds, environment creation, and assemblies must be submitted as SLURM jobs (`sbatch`) or left for the user to run.
