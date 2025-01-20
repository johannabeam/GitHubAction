FROM condaforge/miniforge3

ARG PCANGSD_VERSION="v1.36.0"
ENV WKDIR=/opt/pcangsd

RUN apt update -y  && \
    apt upgrade -y && \
    apt install -y build-essential

WORKDIR $WKDIR
RUN git clone https://github.com/Rosemeis/pcangsd.git $WKDIR && \
    git checkout $PCANGSD_VERSION                            && \
    conda update -n base -c conda-forge conda                && \
    conda env create -f $WKDIR/environment.yml               && \
    echo "conda activate pcangsd" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]
