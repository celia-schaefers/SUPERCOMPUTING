# Assignment 5

## Workflow:

1. Downloads and unpacks data with `scripts/01_download_data.sh`
2. Trims and filters each sample pair with fastp through `scripts/02_run_fastp.sh`
3. Runs both steps from a single entry point in `pipeline.sh`

Sequence data is **not** tracked in git (included in `.gitignore`)

## Directory Structure

```
assignment_05/
├── pipeline.sh              # runs the whole workflow
├── README.md                # this file
├── .gitignore               # keeps sequence data out of GitHub
├── scripts/
│   ├── 01_download_data.sh  # download and extract FASTQ files
│   └── 02_run_fastp.sh      # trim one sample (R1 + R2)
├── log/                     # fastp HTML reports (one per sample)
└── data/                    # NOT tracked by git
    ├── raw/                 # downloaded .fastq.gz files
    └── trimmed/             # trimmed .trimmed.fastq.gz files
```

## How to Run the Pipeline

1. Log in to `bora` and go to the assignment directory:
```cd ~/SUPERCOMPUTING/assignments/assignment_05
```
2. Make sure `fastp` is available (`fastp --version`)
3. Make the scripts executable:
```chmod +x pipeline.sh scripts/*.sh
```
4. Run:
```./pipeline.sh
```

**What it will do:** download the tarball, extract the FASTQ files into `data/raw/`, delete the tarball, then trim every sample. Trimmed reads go to `data/trimmed/` and one HTML quality report per sample goes to `log/`.

**Expected output:** 392 files in `data/raw/`, 392 files in `data/trimmed/`, and 196 files in `log/`.

## Reflection

I initally added a gunzip loop to the download script but that left plain `.fastq` files, so `02_run_fastp.sh` couldn't find the `.fastq.gz` names it expected, I fixed it by removing the loop and re-downloading the data. I also started with the HTML for logs being named from the full R2 path, which gave `./log/./data/raw/...html`. Using `basename` to get just the sample name fixed that. Pathing for the different scripts took some working out, I had to make multiple fixes after writting `pipeline.sh` so that everything was referenced correctly from the same starting point.

I learned/practiced using string substitution (`${VAR/old/new}`) to derive related file names from a single input, that fastp can read and write gzipped FASTQ directly, and using a `.gitignore` to keep large data files out of a repo.

Each script does a single step which can be tested alone before it is used sequentially. `01_download_data.sh` gets the data, `02_run_fastp.sh` processes a single sample, and `pipeline.sh` brings them together and runs trimming on each fastq.

Pros of spliting the scripts and running them through a pipeline file include it being easy to test and debug one piece at a time, scripts being individually reusable, the pipeline being very readable, and ability to easily add steps later. Cons include more files to keep track of, making paths and naming matching across scripts, and going sample by sample (not the quickest).
