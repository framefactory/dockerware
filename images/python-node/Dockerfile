# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH CUDA, PYTHON, PYTORCH

FROM ubuntu:22.04

# add user with UID 1000
ENV USER_NAME user
RUN groupadd --gid 1000 $USER_NAME \
 && useradd --uid 1000 --gid $USER_NAME --shell /bin/bash --create-home $USER_NAME

# install dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends ca-certificates curl wget vim git \
    build-essential libssl-dev \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# TEMPORARY!!!
# RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl wget vim git

# add some additional bash aliases
RUN echo "alias cda='cd /app'\nalias ..='cd ..'" >> /home/$USER_NAME/.bash_aliases

############################
# PYTHON / PYTORCH

# install miniconda
ENV CONDA_DIR /opt/miniconda
WORKDIR /home/$USER_NAME
RUN curl -o miniconda-install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
 && bash miniconda-install.sh -b -p $CONDA_DIR \
 && eval "$($CONDA_DIR/bin/conda shell.bash hook)" \
 && conda init --system \
 && conda create -n deep python=3.10 \
 && conda activate deep \
 && conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia \
 && conda install -c conda-forge numpy scipy sympy pandas matplotlib pillow tqdm tensorboard einops scikit-learn librosa \
 && conda install -c conda-forge jupyter ipykernel ipywidgets \
 && conda clean --all

############################
# NODE.JS

# node version
ENV NODE_VERSION 19.6.0

# install node version manager, node, and update npm
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh"

# ensure nvm is available for user
RUN cat $NVM_DIR/nvm.sh >> /home/$USER_NAME/.bashrc

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
RUN corepack enable

#############################
# ENTRYPOINT

# create app directory, set as startup directory
RUN mkdir /app && chown $USER_NAME:$USER_NAME /app
WORKDIR /app

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default command
CMD ["node"]