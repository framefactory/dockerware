# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch deep learning development environment

FROM framefactory/python-base:latest

ENV USER_NAME main
USER $USER_NAME

RUN python -m pip install --upgrade pip  \
 && python -m pip install jupyter ipykernel ipywidgets \
                          numpy scipy sympy pandas scikit-learn matplotlib pillow tqdm \
                          tensorboard einops librosa xformers \
                          torch torchvision torchaudio \
 && python -m pip cache purge
 