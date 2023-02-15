# DOCKER IMAGE SETUP SCRIPT
# Install Conda/PyTorch nightly deep learning development environment

FROM framefactory/python-base:latest

ENV USER_NAME main
USER $USER_NAME

RUN python -m pip install --upgrade pip  \
 && python -m pip install jupyter ipykernel ipywidgets \
                          numpy scipy sympy pandas scikit-learn matplotlib pillow tqdm \
                          tensorboard einops librosa \
 && python -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu118 \
 && python -m pip cache purge
 
