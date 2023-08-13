#!/bin/bash
# Job name:
#SBATCH --job-name=hopper
#
# Partition:
#SBATCH --partition=class
#
# Number of nodes:
#SBATCH --qos=high
#SBATCH --account=class
#
#
# Processors per task:
#SBATCH -N 4
#SBATCH --cpus-per-task=4
#
#Number of GPUs, this can be in the format of "gpu:[1-4]", or "gpu:K80:[1-4] with the type included
#SBATCH --gres=gpu:1
#
#SBATCH --mem=8gb 
# Wall clock limit:
#SBATCH --time=05:00:00
#
## Command(s) to run (example):

source ~/.bashrc
conda activate project

## Clone this from LOGO
srun -N 1 --mem=8gb python3 /fs/classhomes/fall2022/cmsc828w/c828w030/project/LOGO/logo/run_logo.py --env-num 1 &
## Our code
srun -N 1 --mem=8gb python3 /fs/classhomes/fall2022/cmsc828w/c828w030/project/cmsc828w-project/LOGO_Modified/logo/run_logo.py --env-num 1 --clip-epsilon 0.2 &
srun -N 1 --mem=8gb python3 /fs/classhomes/fall2022/cmsc828w/c828w030/project/cmsc828w-project/LOGO_Modified/logo/run_logo.py --env-num 1 --use_ddqn --clip-epsilon 0.2 &
srun -N 1 --mem=8gb python3 /fs/classhomes/fall2022/cmsc828w/c828w030/project/cmsc828w-project/LOGO_Modified/logo/run_logo.py --env-num 1 --use_ddqn --clip-epsilon 0 &
wait