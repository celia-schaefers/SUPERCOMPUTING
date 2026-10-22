#!/bin/bash
set -euo pipefail

# Deletes everything the pipeline generates so it can be re-run from scratch.
# Keeps data/SraRunTable.csv, the SLURM logs, and the data folders themselves
# (only their contents are removed, so symlinks to scratch space stay in place).

rm -rf ./data/raw/* ./data/clean/* ./data/dog_reference/* ./fasterq.tmp.*
rm -f ./output/*.sam ./output/*.bam ./output/*_fastp.html ./output/dog_read_summary.tsv

ls -la ./data ./output
