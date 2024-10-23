# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH NODE.JS

FROM framefactory/ubuntu-dev:22.04

ENV USER_NAME=main
USER root

# install chrome
ENV CHROME_PACKAGE google-chrome-stable_current_amd64.deb
RUN wget https://dl.google.com/linux/direct/$CHROME_PACKAGE \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y ./$CHROME_PACKAGE \
    fonts-ipafont-gothic fonts-wqy-zenhei \
    fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
 && rm $CHROME_PACKAGE \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# node version
ENV NODE_VERSION=23.0.0

# install node version manager, node, and update npm
ENV NVM_DIR=/usr/local/nvm

RUN mkdir -p $NVM_DIR \
 && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
 && /bin/bash -c "source $NVM_DIR/nvm.sh" \
 && chown -R $USER_NAME:$USER_NAME $NVM_DIR \
 && cat $NVM_DIR/nvm.sh >> /home/$USER_NAME/.bashrc

ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# activate pnpm package manager
RUN corepack enable \
 && corepack prepare pnpm@latest --activate

# entrypoint
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

# default user and command
USER $USER_NAME
CMD ["node"]
