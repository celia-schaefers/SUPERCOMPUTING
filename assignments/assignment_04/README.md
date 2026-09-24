#Assignment 4

## Locations of relevant files

```
└── $HOME/
	├── SUPERCOMPUTING
		└── assignments/
			└── assignment_04/
				├── data/
					├── GCF_000001735.4_TAIR10.1_genomic_copy_copy.fna
					├── GCF_000001735.4_TAIR10.1_genomic_copy.fna	
					└── GCF_000001735.4_TAIR10.1_genomic.fna
				├── summarize_fasta.sh
				└── README.md
	└── /programs
		├── install_gh.sh
		└── install_seqtk.sh		
```


## Command to run summarize_fasta.sh on all fasta files:

for file in data/*; do bash summarize_fasta.sh "$file";done


## Reflection

Challenges included fixing up {} and () for brace expansion and command execution, understanding installed programs' command syntax and specific flags, and moving files around easily (typing out absolute path takes a while but relative can be hard to remember). It was challenging to figure out the exact line for running the summarization script on all the fasta files.

New things I learned include taking user input in a script and using in line command execution. It also reinforced using bash commands and variables.

$PATH is a list of directories the shell searches when you use a command. It looks for the executable corresponding to the command in each location. This way commands can be used without specifying where their instructions lie. When you install programs into your space you add their location to $PATH in ~/.bashrc (start up command file) so they are on the list of locations to check.
