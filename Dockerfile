FROM continuumio/anaconda3

RUN apt update -y
RUN apt upgrade -y
RUN apt search g++
RUN apt install -y build-essential

RUN git clone https://github.com/Rosemeis/pcangsd.git
RUN cd pcangsd && \
    conda env create -f environment.yml && \
    pip3 install --user -r requirements.txt && \
    pip3 install .