# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch deep learning development environment

FROM framefactory/conda-base:latest

ENV USER_NAME=main
USER $USER_NAME

ENV CONDA_CMD=/opt/miniconda/bin/conda

RUN eval "$($CONDA_CMD shell.bash hook)" \
 && conda init \
 && conda create -y -n torch python=3.11 \
 && conda activate torch \
 && pip install torch torchvision --index-url https://download.pytorch.org/whl/cu126 \
# && pip install --upgrade jupyter ipykernel ipywidgets \
 && pip install --upgrade opencv-python einops scipy scikit-learn scikit-image matplotlib \
 && pip install --upgrade diffusers transformers datasets peft accelerate \
 && pip install --upgrade tqdm pydantic dacite watchdog python-slugify imagededup \
 && pip cache purge \
 && conda clean --all
