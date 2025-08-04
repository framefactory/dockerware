# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH NODE.JS

FROM framefactory/ubuntu-dev:22.04

ENV USER_NAME=main
USER root

# node version
ENV NODE_VERSION=24.5.0

# install node version manager, node, and update npm
ENV NVM_DIR=/usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh" \
 && chown -R $USER_NAME:$USER_NAME $NVM_DIR \
 && cat $NVM_DIR/nvm.sh >> /home/$USER_NAME/.bashrc

ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

RUN corepack enable pnpm \
 && corepack install --global pnpm@10.14.0

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default user and command
USER $USER_NAME
CMD ["node"]
