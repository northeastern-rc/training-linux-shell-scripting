#!/bin/bash

####Use during training####
#SBATCH --partition=reservation
#SBATCH --reservation=bootcamp_cpu_2023
## Reservation bootcamp_cpu_2023 will not be available after bootcamp
#######################################
####Use after training####
##SBATCH --partition=express
####Remove 1 # from the above sbatch command####
#######################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=divide_and_split_files
#SBATCH --time=00:10:00
#SBATCH --mem=2GB
#SBATCH --output=ex1.out
#SBATCH --error=ex1.err

## This script demonstrates basic and advanced Linux utilities to divide a larger file into several small files.

#download the text of Moby Dick using the ”wget” utility (single-line command):
wget https://gist.github.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt

# List the files before and after running the 'split' command:
echo "list of files in directory $PWD before split command:"
ls 
split mobydick.txt
echo "list of files in directory $PWD after split command:"
ls

# Check how many rows each file has with the “wc -l” utility:
echo "Number of lines in file mobydick.txt:"
wc -l mobydick.txt
echo "How many rows each of the remaining files has:"
wc -l x*

# Split the file moby-dick.txt into 4 files, label the output files numerically rather than alphabetically, set the number of digits to 1, and have a prefix of “part-”. i.e:part-1 , part-2, part-3, part-4:

split -a 1 -n 4 -d mobydick.txt part-
ls part* 

