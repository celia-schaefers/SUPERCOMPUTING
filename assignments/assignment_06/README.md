# Assignment 6: Software and Environments

> Assembling *E. coli* phage genomes from Oxford Nanopore reads with **Flye v2.9.6**, installed three different ways: **conda**, **local build**, and **HPC module**.

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

```bash

cd SUPERCOMPUTING/assignments/assignment_06

bash pipeline.sh

```

**What it does:**

1. Downloads the raw reads to `./data/`
2. Builds Flye v2.9.6 in `~/programs/Flye`
3. Creates the `flye-env` conda environment and writes `flye-env.yml`
4. Runs Flye three times (conda, module, local), keeping only the assembly and log for each
5. Prints the last 10 lines of each Flye log to the screen

When tested, each method took about 4 minutes, with conda finishing first, then module, then local. 

---

## Task 1: Directory Setup

Used mkdir and touch to follow the given directory structure for eveything not created by a script (scripts, README)

---

## Task 2: Download Raw ONT Data

- **Dataset:** SRR33939694 ([SRX29141853](https://www.ncbi.nlm.nih.gov/sra/SRX29141853[accn]))
- **Script:** `scripts/01_download_data.sh`
- **URL:** `https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1`
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

<!-- Steps: load miniforge3, create with mamba, activate with conda, export flye-env.yml, deactivate. -->

---

## Task 5: Designing the Flye Command

```bash
flye --nano-hq ./data/SRR33939694.fastq.gz \
     --meta \
     --threads 6 \
     --out-dir <output_dir>
```
---

## Task 6: Running Flye Three Ways

| Method | Script | Output |
|---|---|---|
| Conda | `03_run_flye_conda.sh` | `assemblies/assembly_conda/` |
| Module | `03_run_flye_module.sh` | `assemblies/assembly_module/` |
| Local | `03_run_flye_local.sh` | `assemblies/assembly_local/` |

<!-- How each script cleans up its output directory. -->

---

## Task 7: Comparing the Log Files

```bash
for log in $(find ./assemblies -name '*_flye.log' | sort); do
  echo "=============== $log ==============="
  tail -n 10 "$log"
done
```

| Assembly | Timestamp | Total length | Fragments | Fragments N50 | Largest frg | Scaffolds | Mean coverage | Final assembly |
|---|---|---|---|---|---|---|---|---|
| assembly_conda | 2026-10-19 20:10:35 | 91713 | 2 | 47428 | 47428 | 0 | 422 | `/sciclone/home/caschaefers/SUPERCOMPUTING/assignments/assignment_06/assemblies/assembly_conda/assembly.fasta` |
| assembly_local | 2026-10-19 20:20:23 | 91713 | 2 | 47428 | 47428 | 0 | 422 | `/sciclone/home/caschaefers/SUPERCOMPUTING/assignments/assignment_06/assemblies/assembly_local/assembly.fasta` |
| assembly_module | 2026-10-19 20:15:29 | 91713 | 2 | 47428 | 47428 | 0 | 422 | `/sciclone/home/caschaefers/SUPERCOMPUTING/assignments/assignment_06/assemblies/assembly_module/assembly.fasta` |

---

## Task 8: The Pipeline Script

<!-- How pipeline.sh runs everything in order without needing user input. -->

The pipeline runs each script from bash one after another.

---

## Task 9: Clean Re-run

Deleted everything and reran from pipeline script.

---

## Task 10: Documentation

This README.

---

## Task 11: Pushing to GitHub

The data files and Flye outputs are excluded by the repository `.gitignore` (`*.fastq.gz`, `data/`, `assemblies/`).

---

## Reflection

### Challenges

I ran into some naming differences that had to be fixed. Having so many files did mean alternating between them in terminal was a little tedious. 

### New Things I Learned

Praticed creating full pipeline with organized structure and tested using ai agent to help with code and orchestration.

### Thoughts on the Three Methods

Conda did finish the fastest, though I feel like it cannot always be trusted. I would say we have the most control over the locally managed version of the software, but it also is work to set up and maintain. I think which I use will depend on what tool and how I am using it, conda for common tools and local for things that are less common and I want full control over versioning and such.

---

## AI Usage

<!-- Which AI tools you used, what you used them for, and what you verified or changed yourself. -->

Used Claude Opus 5.5 to review and edit scripts, create README structure, and test agent submission to SLURM.
