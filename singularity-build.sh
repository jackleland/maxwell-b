#!/bin/bash
#SBATCH --job-name=singularity-build
#SBATCH --ntasks-per-node=4
#SBATCH --nodes=1
#SBATCH --time=2:00:00
#SBATCH --partition=short

SINGULARITY_CACHEDIR=$TMPDIR SINGULARITY_TMPDIR=$TMPDIR singularity build --sandbox $SCRATCH/maxwell-b-sandbox docker://ghcr.io/jackleland/maxwell-b:latest

cp -r $SCRATCH/maxwell-b-sandbox $DATA/singularity/maxwell-b-sandbox
rm -rf $SCRATCH/maxwell-b-sandbox
