FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

WORKDIR /ControlNet-main

# Create the environment:
ADD src/ .

# Since wget is missing
RUN apt-get update && apt-get install -y wget

#Install MINICONDA
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && \
	rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH

# Install gcc as it is missing in our base layer
RUN apt-get update && apt-get -yq install gcc libgtk2.0-dev

RUN conda env create -f environment.yaml

# SHELL ["conda", "run", "-n", "control", "/bin/bash", "-c"]
# EXPOSE 7860

ENTRYPOINT ["conda", "run", "-n", "control", "python", "gradio_canny2image.py"]