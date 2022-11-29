# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH CUDA, PYTHON, PYTORCH

FROM nvidia/cuda:11.8.0-base-ubuntu22.04

# add user with UID 1000
ENV USER sentinel
RUN groupadd --gid 1000 $USER \
 && useradd --uid 1000 --gid $USER --shell /bin/bash --create-home $USER

# install dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    curl wget vim git dos2unix build-essential ca-certificates libssl-dev \
    python3 python3-pip python-is-python3 \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# add some additional bash aliases
RUN echo "alias cda='cd /app'\nalias ..='cd ..'" >> /home/$USER/.bash_aliases

############################
# PYTHON / PYTORCH

RUN python -m pip install numpy scipy matplotlib pillow \
                           torch torchvision opencv-python \
 && python -m pip cache purge

############################
# NODE.JS

# node version
ENV NODE_VERSION 19.1.0

# install node version manager, node, and update npm
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh"

# ensure nvm is available for user
RUN cat $NVM_DIR/nvm.sh >> /home/$USER/.bashrc

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
RUN corepack enable

# create app directory, set as startup directory
RUN mkdir /app && chown $USER:$USER /app
WORKDIR /app

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default command
CMD ["node"]