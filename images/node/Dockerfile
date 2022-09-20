# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH NODE.JS

FROM ubuntu:20.04

# add user 'node' with UID 1000
RUN groupadd --gid 1000 node \
 && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# node version
ENV NODE_VERSION 18.9.0

# install dependencies
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl wget vim git dos2unix \
 && apt-get install -y build-essential ca-certificates libssl-dev \
 && apt-get install -y python3 python3-pip python-is-python3

# add some additional bash aliases
RUN echo "alias cda='cd /app'\nalias ..='cd ..'" >> /home/node/.bash_aliases

# increase number of file watchers
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p

# install node version manager, node, and update npm
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh"

# ensure nvm is available for user 'node'
RUN cat $NVM_DIR/nvm.sh >> /home/node/.bashrc

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
RUN corepack enable

# cleanup
RUN apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# create app directory, set as startup directory
RUN mkdir /app && chown node:node /app
WORKDIR /app

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default command
CMD ["node"]
