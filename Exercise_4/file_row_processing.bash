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
#SBATCH --job-name=file_row_processing
#SBATCH --time=00:10:00
#SBATCH --mem=2GB
#SBATCH --output=ex4.out
#SBATCH --error=ex4.err

## Error handling:
# By default, if any command in the script fails, subsequent commands will be executed unless explicit action is taken to handle the failure. When setting the following line, script will exit immediately if a command/pipeline exits with non-zero status.
set -e

# In this example, we’ll combine the use of lists, shell variables, pipes, evaluation of arithmetic and conditional expressions, and loops.

# Define the input/output files as variables:
input_text=../Exercise_1/mobydick.txt
rows_file=rows.txt
output_file=post_processing_file.txt

# Define the number of rows to process from a command-line argument:
row_num=$1
# Evaluate the number of rows in the rows file using utility `wc -l` , then pipe the 
# output to the 'awk' utility which will print the first argument:
rows_file_length=`wc -l ${rows_file} | awk '{print $1}'` 

# Check if $row_num is a valid number (using a regular expression) and smaller than number of lines in $rows_file:
if ! [[ "$row_num" =~ ^[0-9]+$ ]] || [[ $row_num -gt $rows_file_length ]]; then
	echo "error: Input argument is not a number, or greater than $rows_file_length" >&2; exit 1
fi

# Get the subset of rows and convert it to a shell list/array:
subset_rows_list=`cat $rows_file | head -n $row_num`

# Loop through the array of rows, print each input txt row based on the array variables:
# Keep count of number of rows processed:
row_count=1
for row in ${subset_rows_list[@]}; do
	echo "Row number $row in the input txt file: $input_text says:"
	current_line=`sed "${row}q;d" $input_text`
	echo "$current_line"
	echo "Success!!! $row_count rows were processed!"
	((row_count+=1)) ## increment counter
done
