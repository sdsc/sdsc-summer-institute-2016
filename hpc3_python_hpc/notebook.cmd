#!/bin/bash
################################################################################
#  Designed to run on SDSC's Comet resource.
#  Andrea Zonca, San Diego Supercomputer Center Aug 2016
################################################################################
#SBATCH --job-name="notebook"
#SBATCH --output="notebook.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
### Just if you have an existing reservation
#SBATCH --reservation=SI2016D4Afternoon
#SBATCH -t 04:00:00

## Case 1: use Comet Python Install
## module load python scipy

## Case 2: use Another Python Install (Anaconda)
export PATH=/oasis/scratch/comet/zonca/temp_project/anaconda/bin:$PATH
export PYTHONPATH=

## Launch the notebook
jupyter notebook --no-browser --ip="*"
