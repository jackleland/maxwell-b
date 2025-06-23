#!/usr/bin/env bash
# Builds and runs maxwell in Singularity.

PORT=9041
# host dir used like your docker volume
export MAXWELL_SINGULARITY_VOL="$SCRATCH/.singularity/maxwell-vol"
export MAXWELL_SERVER_FILES="/mnt/maxwell-server-files"
export MAXWELL_LOG_LEVEL="debug"
export NGPUS=1
export IMAGE_PATH="$DATA/singularity/maxwell-b.sif"
export WORKING_DIR="."
export HYDRA_LAUNCHER=fork

# ensure the volume dir exists
mkdir -p "$MAXWELL_SINGULARITY_VOL"

singularity instance start \
    --nv \
    -B "$MAXWELL_SINGULARITY_VOL":"$MAXWELL_SERVER_FILES, $TMPDIR:/tmp, $WORKING_DIR:/app" \
    --env PORT="$PORT" \
    --env MAXWELL_SERVER_FILES="$MAXWELL_SERVER_FILES" \
    --env MAXWELL_LOG_LEVEL="$MAXWELL_LOG_LEVEL" \
    --env NGPUS="$NGPUS" \
    --env HYDRA_LAUNCHER="$HYDRA_LAUNCHER" \
    "$IMAGE_PATH" maxwell-b