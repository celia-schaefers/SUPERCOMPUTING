#!/bin/bash
set -ueo pipefail

cd ./data

wget -nc https://gzahn.github.io/data/fastq_examples.tar

tar -xf fastq_examples.tar -C ./raw
rm fastq_examples.tar
