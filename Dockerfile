FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

WORKDIR /ControlNet-main

# Create the environment:
ADD src/ .
ADD test/ test/

# Since wget is missing
RUN apt-get update && apt-get install -y wget

#Install MINICONDA
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && \
	rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth -P /ControlNet-main/models

# Install gcc as it is missing in our base layer
RUN apt-get update && apt-get -yq install gcc libgtk2.0-dev

RUN conda env create -f environment.yaml

ENTRYPOINT ["conda", "run", "-n", "control", "python", "test.py"]