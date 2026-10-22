#!/bin/bash
set -euo pipefail

#bash scripts/01_download_data.sh
#bash scripts/02_flye_2.9.6_manual_build.sh
#bash scripts/02_flye_2.9.6_conda_install.sh
#bash scripts/03_run_flye_conda.sh
#bash scripts/03_run_flye_module.sh
#bash scripts/03_run_flye_local.sh

for log in $(find ./assemblies -name '*_flye.log' | sort); do
  echo "=============== $log ==============="
  tail -n 10 "$log"
done
