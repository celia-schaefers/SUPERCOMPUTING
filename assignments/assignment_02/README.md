# Assignment 2
Celia Schaefers, 9/16/2026, assignment 2

## Assignment Tasks and Commands Used
Task 1. Set Up Your Semester Workspace on the HPC

For this task we needed to SSH into the bora cluster and check that ~/SUPERCOMPUTING/assignments/assignment_02/data/ is a valid directory.

**Actions:**

used alias bora to SSH into cluster (locally saved as alias bora="ssh caschaefers@bora.sciclone.wm.edu")

cd ~/SUPERCOMPUTING/assignments/assignment_02/data/

confirmed set up as a valid directory (pwd)
_____________________________________________________________________
Task 2: Download Files from NCBI via Command-Line FTP

For this task we needed to use the ftp command to connect to the NCBI FTP server and download
- GCF_000005845.2_ASM584v2_genomic.fna.gz
- GCF_000005845.2_ASM584v2_genomic.gff.gz

**Actions:**

ftp ftp.ncbi.nlm.nih.gov wasn't working on git bash, so I tried it in Windows command prompt. That let me login and do the following

ftp ftp.ncbi.nlm.nih.gov

username: anonymous

password: caschaefers@wm.edu

cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/

but then when trying

get GCF_000005845.2_ASM584v2_genomic.fna.gz

I recieved an error "unable to build data connection: connection refused"

So I used the command bye, then tried with cURL (client url), the -O tag saves under original filename

curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz

curl -O https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz

This worked, so I continued to the next step.
_____________________________________________________________________
Task 3: File Transfer and Permissions
3.1 Transfer to HPC Using FileZilla (or another client)

For this task we needed to transfer the files downloaded from NCBI to the HPC using a graphical interface.

**Actions:**

I used WinSCP for this step. After opening the WinSCP client I entered the following details in a new remote tab:

- Host: bora.sciclone.wm.edu
- Username: caschaefers
- Password: my password
- Port: 22
- Protocol: SFTP

I clicked through the file exploring interface to get to ~/SUPERCOMPUTING/assignments/assignment_2/data/ 

and uploaded both .gz files I just downloaded by dragging them from the local connection tab to the HPC tab.

3.2 Ensure Files Are World-Readable

For this task we needed to check the permissions of the files and ensure they would be readable by the instructor and everyone else

**Actions:**

cd ~/SUPERCOMPUTING/assignments/assignment_02/data/

ls -l #to show file types and permissions

output showed -rw-r----- before each file, meaning they are regular files, I can read and write, and the group can read

Since others could not read, I used the commands

chmod o+r GCF_000005845.2_ASM584v2_genomic.fna.gz

chmod o+r GCF_000005845.2_ASM584v2_genomic.gff.gz

I then verified the correct permissions were added with ls -l
_____________________________________________________________________
Task 4: Verify File Integrity with md5sum

For this task we needed to confirm that the files transferred correctly by using md5sum on the local and HPC versions.

**Actions:**

Locally

cd ~/Desktop/Repos/SUPERCOMPUTING/assignments/assignment_02/data/

md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz

**Local md5sum**

0f52ffc94af5ddf544ff89cc6f546b0c *GCF_000005845.2_ASM584v2_genomic.gff.gz

c13d459b5caa702ff7e1f26fe44b8ad7 *GCF_000005845.2_ASM584v2_genomic.fna.gz

On HPC

cd ~/SUPERCOMPUTING/assignments/assignment_02/data/

md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz

md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz

**HPC md5sum**

0f52ffc94af5ddf544ff89cc6f546b0c  GCF_000005845.2_ASM584v2_genomic.gff.gz

c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz

Since the hashes match, the files are the same and successfully transfered.

_____________________________________________________________________
Task 5: Create Useful Bash Aliases

For this task we needed to add the following aliases to our start up file:

- alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
- alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
- alias ll='ls -alFh --group-directories-first'


**Actions:**

This wasn't working for me with ~/.bashrc so I checked my shell with

echo $SHELL

and got back

/bin/tcsh/

I tried to change it using a command I found described online, but it said I didn't have permissions and to contact admins if needed.

So I edited with

nano ~/.cshrc

added these lines for tcsh:

alias u 'cd ..; clear; pwd; ls -alFh --group-directories-first'

alias d 'cd -; clear; pwd; ls -alFh --group-directories-first'

alias ll 'ls -alFh --group-directories-first'

then ^o -> enter -> ^x

then source ~/.cshrc

Here is what each added alias does:
- ll - ls with useful tags to show hidden files, long format, indicate type, human readable sizes, and list directories before files 
- u - moves up one directory, clears terminal, prints directory path, lists directory contents like ll
- d - returns to previous working directory, clears terminal, prints directory path, lists directory contents like ll
_____________________________________________________________________
Task 6: Document Everything in README.md

**Actions:**

Wrote what you are reading here! nano READMR.md -> edited -> ^o -> enter -> ^o

## Directory Structure
```
└── assignment_02/
	├── data/
		├── GCF_000005845.2_ASM584v2_genomic.fna.gz
		└── GCF_000005845.2_ASM584v2_genomic.gff.gz
	└── README.md
```
## Reflection

For this assignment I took notes on commands and actions I took as I did them, which was a big help in writing the README at the end. I read through the instruction document fully before starting which also helped with documenation. Starting the work earlier would have been better to give cushion time when steps needed some puzzling out. I also need to work on moving files around, WinSCP and ftp from the command line are new and it would be benefical to practice.
