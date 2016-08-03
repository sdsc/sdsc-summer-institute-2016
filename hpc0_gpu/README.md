Content
=======
This directory contains the slides and exercises for the SDSC 2016
Summer Institute half-day workshop on GPU computing and programming.

Andreas Goetz, SDSC (agoetz@sdsc.edu)


How to use Comet's GPU nodes
============================

# Obtain interactive shared GPU node on SDSC Comet (one hour)
srun --partition=gpu-shared --nodes=1 --ntasks-per-node=6 \
     --gres=gpu:1 -t 01:00:00 --pty --wait=0 --export=ALL /bin/bash
     
# Load CUDA module
module load cuda

# Check nvcc compiler version
nvcc --version

# Check installed GPUs with NVIDIA System Management Interface (nvidia-smi)
# Check visible devices (should be set to free GPU)
nvidia-smi  # check output for any jobs running on GPUs
echo $CUDA_VISIBLE_DEVICES  # should be set by queuing system to free GPU
export CUDA_VISIBLE_DEVICES=x  # where x is free GPU (should already be set)


NVIDIA CUDA Toolkit code samples
================================

# Copy and compile CUDA code samples that come with the CUDA Toolkit
cuda-install-samples-7.0.sh ./  # install into current directory
cd NVIDIA_CUDA-7.0_Samples
make

# Or compile only samples of interest, e.g. deviceQuery
cd 1_Utilities/deviceQuery
make

# Check out the many code samples
# Very instructive resource

# Run deviceQuery to query information on available GPUs
cd 1_Utilities/deviceQuery/
./deviceQuery


Simple code samples accompanying slides
=======================================

# See directory cuda-samples
# Compile with 
nvcc example.cu -o example.x

# See directory openacc-samples
# Compile with 
pgcc example.c -o example.x -acc -Minfo=accel


