#####
# Dockerfile for Maxwell-B Solver
######

FROM nvidia/cuda:12.9.0-devel-ubuntu24.04

# Do as much installation as possible to make use of caching as installing
# is very slow.
# A few comments:
# 1) openmpi seems to give trouble so use mpich2.
# 2) Use a virtualenv to avoid outdated system packages (i.e. six).
RUN apt-get update && \
    apt-get install -y python3-pip \
                       python3-setuptools \
                       libhdf5-serial-dev \
                       mpich \
                       nvidia-driver-535-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /app
COPY ./requirements.txt /app

# install python packages
RUN pip install --break-system-packages -r requirements.txt \
    pip cache purge

# Make symlinks for python and pip
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy the rest of the application code
COPY . /app

EXPOSE 9041

CMD ["./start_maxwell_podman"]
