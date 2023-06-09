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
#SBATCH --job-name=file_managment
#SBATCH --time=00:10:00
#SBATCH --mem=2GB
#SBATCH --output=ex3.out
#SBATCH --error=ex3.err

## This script demonstrates basic file management automation. The script will create 4 directories, and will create 4 files inside those directories.

# Define your work directory, and enter it:
my_work_dir=$PWD
cd $my_work_dir

# Define the range of directories:
start_count=1
end_count=4

# Loop through the range and create directories:
for (( i=$start_count; i<=$end_count; i++ ))
do
    # Define the new directory name based on the counter value:
	dir_name=dir.$i
	# Create the new directory:
	mkdir $dir_name
	# Create a file inside the new directory, with contents "Hello from directory ...":
	echo "Hello from directory $dir_name" > $dir_name/myfile
done
 
