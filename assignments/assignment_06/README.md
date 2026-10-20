# Assignment 6: Software and Environments

> Assembling *E. coli* phage genomes from Oxford Nanopore reads with **Flye v2.9.6**, installed three different ways: **conda**, **local build**, and **HPC module**.

<!-- One or two sentences: what this assignment does and why. -->

---

## Table of Contents

- [Directory Structure](#directory-structure)
- [How to Run](#how-to-run)
- [Task 1: Directory Setup](#task-1-directory-setup)
- [Task 2: Download Raw ONT Data](#task-2-download-raw-ont-data)
- [Task 3: Flye Local Build](#task-3-flye-local-build)
- [Task 4: Flye Conda Install](#task-4-flye-conda-install)
- [Task 5: Designing the Flye Command](#task-5-designing-the-flye-command)
- [Task 6: Running Flye Three Ways](#task-6-running-flye-three-ways)
- [Task 7: Comparing the Log Files](#task-7-comparing-the-log-files)
- [Task 8: The Pipeline Script](#task-8-the-pipeline-script)
- [Task 9: Clean Re-run](#task-9-clean-re-run)
- [Task 10: Documentation](#task-10-documentation)
- [Task 11: Pushing to GitHub](#task-11-pushing-to-github)
- [Reflection](#reflection)
- [AI Usage](#ai-usage)

---

## Directory Structure

```
assignment_06/
├── assemblies/                          # created by the pipeline (not on GitHub)
│   ├── assembly_conda/
│   │   ├── conda_assembly.fasta
│   │   └── conda_flye.log
│   ├── assembly_local/
│   │   ├── local_assembly.fasta
│   │   └── local_flye.log
│   └── assembly_module/
│       ├── module_assembly.fasta
│       └── module_flye.log
├── data/                                # created by the pipeline (not on GitHub)
│   └── SRR33939694.fastq.gz
├── scripts/
│   ├── 01_download_data.sh
│   ├── 02_flye_2.9.6_conda_install.sh
│   ├── 02_flye_2.9.6_manual_build.sh
│   ├── 03_run_flye_conda.sh
│   ├── 03_run_flye_local.sh
│   └── 03_run_flye_module.sh
├── flye-env.yml                         # exported conda environment
├── pipeline.sh
└── README.md
```

| File | Purpose |
|---|---|
| `scripts/01_download_data.sh` | Downloads the ONT FASTQ dataset to `./data/` |
| `scripts/02_flye_2.9.6_manual_build.sh` | Clones and builds Flye v2.9.6 locally under `~/programs/Flye` |
| `scripts/02_flye_2.9.6_conda_install.sh` | Creates the `flye-env` conda environment and exports `flye-env.yml` |
| `scripts/03_run_flye_conda.sh` | Runs Flye from the conda environment |
| `scripts/03_run_flye_local.sh` | Runs Flye from the local build |
| `scripts/03_run_flye_module.sh` | Runs Flye from the HPC module |
| `pipeline.sh` | Runs every script in order, then prints the last 10 lines of each log |
| `flye-env.yml` | Exported conda environment documenting all dependencies and versions |

---

## How to Run

**Requirements:** W&M VPN (GlobalProtect, `gp.wm.edu`), a bora account, and `git`, `gcc`, and `make` (all available on bora).

```bash
# 1. Clone the repo and move into this assignment
git clone <repo-url>
cd SUPERCOMPUTING/assignments/assignment_06

# 2. Run the full pipeline (must be run from assignment_06/)
bash pipeline.sh
```

**What it does:**

1. Downloads the raw reads to `./data/`
2. Builds Flye v2.9.6 in `~/programs/Flye`
3. Creates the `flye-env` conda environment and writes `flye-env.yml`
4. Runs Flye three times (conda, module, local), keeping only the assembly and log for each
5. Prints the last 10 lines of each Flye log to the screen

<!-- Approximate total runtime: ___ -->

> **Note:** Never run `conda init`. The scripts load conda with `module load miniforge3` instead.

---

## Task 1: Directory Setup

<!-- How you set up the directory structure. -->

---

## Task 2: Download Raw ONT Data

- **Dataset:** SRR33939694 ([SRX29141853](https://www.ncbi.nlm.nih.gov/sra/SRX29141853[accn]))
- **Source:** <!-- URL -->
- **Script:** `scripts/01_download_data.sh`

<!-- What the data is, and how the script gets it. -->

---

## Task 3: Flye Local Build

- **Script:** `scripts/02_flye_2.9.6_manual_build.sh`
- **Build location:** `~/programs/Flye/bin`

<!-- How the clone and build work, and how flye gets added to $PATH. Pros and cons of this method. -->

---

## Task 4: Flye Conda Install

- **Script:** `scripts/02_flye_2.9.6_conda_install.sh`
- **Environment:** `flye-env`
- **Version installed (`flye -v`):** <!-- ___ -->

<!-- Steps: load miniforge3, create with mamba, activate with conda, export flye-env.yml, deactivate. -->

---

## Task 5: Designing the Flye Command

```bash
flye --nano-hq ./data/SRR33939694.fastq.gz \
     --meta \
     --threads 6 \
     --out-dir <output_dir>
```

| Argument | Why |
|---|---|
| `--nano-hq` | <!-- --> |
| `--meta` | <!-- --> |
| `--threads 6` | <!-- --> |
| `--out-dir` | <!-- --> |

- **Expected coliphage genome size:** <!-- ___ kb -->

---

## Task 6: Running Flye Three Ways

| Method | Script | How Flye is accessed | Output |
|---|---|---|---|
| Conda | `03_run_flye_conda.sh` | <!-- --> | `assemblies/assembly_conda/` |
| Module | `03_run_flye_module.sh` | <!-- --> | `assemblies/assembly_module/` |
| Local | `03_run_flye_local.sh` | <!-- --> | `assemblies/assembly_local/` |

<!-- How each script cleans up its output directory. -->

---

## Task 7: Comparing the Log Files

```bash
for log in $(find ./assemblies -name '*_flye.log' | sort); do
  echo "=============== $log ==============="
  tail -n 10 "$log"
done
```

| Method | Total length | Fragments | N50 | Largest contig | Mean coverage |
|---|---|---|---|---|---|
| Conda | | | | | |
| Module | | | | | |
| Local | | | | | |

**Observations:**

<!-- Did the results match? Anything different between methods? -->

---

## Task 8: The Pipeline Script

<!-- How pipeline.sh runs everything in order without needing user input. -->

---

## Task 9: Clean Re-run

<!-- Did you delete everything except the scripts and re-run? Did it work on the first try? What did you fix? -->

---

## Task 10: Documentation

This README.

---

## Task 11: Pushing to GitHub

The data files and Flye outputs are excluded by the repository `.gitignore` (`*.fastq.gz`, `data/`, `assemblies/`).

---

## Reflection

### Challenges

<!-- -->

### New Things I Learned

<!-- -->

### Thoughts on the Three Methods

| Method | Pros | Cons |
|---|---|---|
| Conda | | |
| Local build | | |
| Module | | |

**Which do I prefer?**

<!-- -->

**Which will I try first on the next assignment?**

<!-- -->

---

## AI Usage

<!-- Which AI tools you used, what you used them for, and what you verified or changed yourself. -->

| Tool | What I used it for |
|---|---|
| | |
