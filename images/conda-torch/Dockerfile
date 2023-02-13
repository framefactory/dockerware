# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch deep learning development environment

FROM framefactory/conda-base:latest

ENV USER_NAME main
USER $USER_NAME

ENV CONDA_CMD /opt/miniconda/bin/conda

RUN eval "$($CONDA_CMD shell.bash hook)" \
 && conda init \
 && conda create -y -n torch python=3.10 \
 && conda activate torch \
 && conda install -y -c conda-forge jupyter ipykernel ipywidgets \
 && conda install -y -c conda-forge numpy scipy sympy pandas scikit-learn matplotlib pillow tqdm \
 && conda install -y -c conda-forge tensorboard einops librosa \
 && python -m pip install torch torchvision torchaudio \
 && python -m pip cache purge \
 && conda clean --all
