# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH CUDA, PYTHON, PYTORCH

FROM nvidia/cuda:12.8.0-runtime-ubuntu22.04

# add user with UID 1000
ENV USER_NAME main

RUN groupadd --gid 1000 $USER_NAME \
 && useradd --uid 1000 --gid $USER_NAME --shell /bin/bash --create-home $USER_NAME

####################
# UBUNTU DEV

# install dependencies (ffmpeg, etc. are required by opencv)
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    curl wget vim git dos2unix build-essential ca-certificates libssl-dev \
    python3 python3-pip python-is-python3 \
    ffmpeg libsm6 libxext6 \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# add some additional bash aliases
RUN echo "alias cda='cd /app'\nalias ..='cd ..'" >> /home/$USER_NAME/.bash_aliases

####################
# CONDA

# install miniconda
ENV CONDA_DIR /opt/miniconda
ENV CONDA_SCRIPT /var/cache/miniconda-install.sh
ENV CONDA_CMD $CONDA_DIR/bin/conda

USER root

RUN curl -o $CONDA_SCRIPT https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
 && bash $CONDA_SCRIPT -b -p $CONDA_DIR \
 && chown -R $USER_NAME:$USER_NAME $CONDA_DIR \
 && $CONDA_CMD clean --all

USER $USER_NAME
RUN $CONDA_CMD init

####################
# NODE.JS

USER root

# node version
ENV NODE_VERSION 23.7.0

# install node version manager, node, and update npm
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh" \
 && chown -R $USER_NAME:$USER_NAME $NVM_DIR \
 && cat $NVM_DIR/nvm.sh >> /home/$USER_NAME/.bashrc

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

RUN corepack enable pnpm \
 && corepack install --global pnpm@10.3.0

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default command
CMD ["node"]

####################
# APP DIR

# create app directory
RUN mkdir /app && chown $USER_NAME:$USER_NAME /app
WORKDIR /app

# set default user
USER $USER_NAME
