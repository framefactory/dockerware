# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch deep learning development environment

FROM framefactory/conda-base:latest

ENV USER_NAME=main
USER $USER_NAME

ENV CONDA_CMD=/opt/miniconda/bin/conda

RUN eval "$($CONDA_CMD shell.bash hook)" \
 && conda init \
 && conda create -y -n torch python=3.10 \
 && conda activate torch \
 && conda install -y pytorch torchvision pytorch-cuda=12.4 -c pytorch -c nvidia \
# && conda install -y -c conda-forge jupyter ipykernel ipywidgets \
 && python -m pip install --upgrade opencv-python einops scipy scikit-learn scikit-image matplotlib \
 && python -m pip install --upgrade diffusers transformers datasets peft accelerate \
 && python -m pip install --upgrade tqdm pydantic dacite watchdog python-slugify \
 && python -m pip cache purge \
 && conda clean --all
