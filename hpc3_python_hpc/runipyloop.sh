for scale in 10 30 50 100 200 500
do
# sed "s/SCALE/$scale/g" slurm.serial.template | sbatch # use an entire node
sed "s/SCALE/$scale/g" slurm.shared.template | sbatch # use only 1 core in the shared queue
done
