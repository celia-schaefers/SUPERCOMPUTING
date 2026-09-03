# Assignment 1


### Overview
First assignment for Supercomputing for Science. Includes project structure designed around principles of reproducibility, and information on my background and personal learning goals for the course.


### Commands used for project structure
```
mkdir assignment_01
cd assignment_01
touch README.md
touch assignment_01_essay.md
mkdir data
mkdir scripts
mkdir output
mkdir logs
mkdir docs
cd data
mkdir raw
mkdir clean
touch clean/clean_data_example_01.csv
touch raw/raw_data_example_01.csv
cd ../
touch docs/example_01.txt
touch logs/logfile_01.log
touch output/result_example_01.txt
touch scripts/script_01.sh
```

### Notes on structure

- `data/raw/` — original data, read-only
- `data/clean/` — processed data, regenerable
- `scripts/` — code with relative paths
- `output/` — script output
- `logs/` — job logs (runs and errors)
- `docs/` — testing, creation, and data docs
- `README.md` — overview, command log, and notes
