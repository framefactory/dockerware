# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH NODE.JS

FROM ubuntu:20.04

# node version
ENV NODE_VERSION 14.15.3

# install dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl wget vim git dos2unix \
 && apt-get install -y build-essential ca-certificates libssl-dev python3

# add some additional bash aliases
RUN echo "alias ..='cd ..'" >> ~/.bash_aliases

# install node version manager, node, and update npm
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh"

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# cleanup
RUN apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# create app directory, set as startup directory
RUN mkdir /app
WORKDIR /app

# entrypoint
COPY entrypoint.sh /var/
ENTRYPOINT ["/var/entrypoint.sh"]

# default command
CMD ["node"]
