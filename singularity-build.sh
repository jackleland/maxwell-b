#!/bin/bash
#SBATCH --job-name=singularity-build
#SBATCH --ntasks-per-node=4
#SBATCH --nodes=1
#SBATCH --time=2:00:00
#SBATCH --partition=short

SINGULARITY_CACHEDIR=$TMPDIR SINGULARITY_TMPDIR=$TMPDIR singularity pull $SCRATCH/maxwell-b.sif docker://ghcr.io/jackleland/maxwell-b:sing-latest

cp -r $SCRATCH/maxwell-b.sif $DATA/singularity/maxwell-b.sif
rm -rf $SCRATCH/maxwell-b.sif
