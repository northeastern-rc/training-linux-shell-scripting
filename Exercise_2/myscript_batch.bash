#!/bin/bash

####Use during training####
#SBATCH --partition=reservation
#SBATCH --reservation=bootcamp_cpu_2023
## Reservation bootcamp_cpu_2023 will not be available after bootcamp
#######################################
####Use after training####
#SBATCH --partition=express
#######################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=shell-script-automation
#SBATCH --time=00:10:00
#SBATCH --mem=2GB
#SBATCH --output=ex2.out
#SBATCH --error=ex2.err

## This script demonstrates basic automation in Shell using a Shell script. We will create a simple script that creates files with different contents:

## use the mobydick.txt file from Exercise 1 to select all lines that contain the word "Mountains". Use the '>' operator to print the output lines into a new file:
grep "Mountains" ../Exercise_1/mobydick.txt > mobydick.Lines-with-Mountains.txt

## print the file contents into the standard output file:
echo "Lines with Mountains:" 
cat mobydick.Lines-with-Mountains.txt

## Replace the word "Mountains" with "Hills" using "sed". Use the '>' operator to print the output lines into a new file "mobydick.Lines-with-Hills.txt":
sed "s/Mountains/Hills/g" mobydick.Lines-with-Mountains.txt > mobydick.Lines-with-Hills.txt

## print the file contents into the standard output file:
echo "Lines with Hills:"
cat mobydick.Lines-with-Hills.txt

