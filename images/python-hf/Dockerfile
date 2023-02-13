# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch deep learning development environment

FROM framefactory/python-torch:latest

ENV USER_NAME main
USER $USER_NAME

RUN python -m pip install datasets evaluate transformers diffusers["torch"] accelerate safetensors \
 && python -m pip cache purge
 