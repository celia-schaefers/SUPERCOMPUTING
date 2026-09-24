# Assignment 4

## What I did

Task 1: already had programs, so nothing to add.

Task 2:
- wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64>
- tar -xzvf gh_2.74.2_linux_amd64.tar.gz
- rm gh_2.74.2_linux_amd64.tar.gz

Task 3: added commands to install_gh.sh

Task 4: Added the location of the gh binary to $PATH in ~/.bashrc

Task 5: already logged in, so nothing to add.

Task 6: created install_seqtk.sh script

Task 7: Looked at seqtk commands and tried some

Task 8: wrote summarize_fasta.sh in assignment_04/ dir

Task 9: see command below

Task 10: Here!

Task 11: If your seeing this I did it

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
(from assignment_04/ dir)
for file in data/*; do bash summarize_fasta.sh "$file";done


## Reflection

Challenges included mixing up {} and () for brace expansion and command execution, understanding installed programs' command syntax and specific flags, and moving files around easily (typing out absolute path takes a while but relative can be hard to remember). It was challenging to figure out the exact line for running the summarization script on all the fasta files, so I think I need to practice in-line loops more.

New things I learned include taking user input in a script and using in-line command execution (looping). It also reinforced using bash commands and variables.

$PATH is a list of directories the shell searches when you use a command. It looks for the executable corresponding to the command in each location. This way commands can be used without specifying where their instructions lie. When you install programs into your space you add their location to $PATH in ~/.bashrc (start up command file) so they are on the list of locations to check.
