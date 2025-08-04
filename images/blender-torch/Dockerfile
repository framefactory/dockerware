# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH BLENDER, NODE.JS

FROM framefactory/conda-torch:latest

ENV USER_NAME=main

####################
# BLENDER

USER root

# SUPPORT FOR GRAPHICS DRIVER, CHECK IF REALLY NEEDED
RUN apt-get update \
 && apt-get install -y libfreetype6 libglu1-mesa libxi6 libxrender1 xz-utils \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# SUPPORT FOR GRAPHICS DRIVER, CHECK IF REALLY NEEDED
 
# blender version
ENV BLENDER_VERSION=4.5.1-linux-x64
ENV BLENDER_MAJOR_VERSION=4.5
ENV BLENDER_PYTHON=python3.11
ENV BLENDER_URL="https://ftp.nluug.nl/pub/graphics/blender/release/Blender$BLENDER_MAJOR_VERSION/blender-$BLENDER_VERSION.tar.xz"
ENV BLENDER_INSTALL_DIR="/opt/blender-$BLENDER_VERSION"
ENV BLENDER_BIN=$BLENDER_INSTALL_DIR/blender
ENV BLENDER_PYTHON_BIN=$BLENDER_INSTALL_DIR/$BLENDER_MAJOR_VERSION/python/bin/$BLENDER_PYTHON

# download and extract blender
RUN curl -o /tmp/blender-$BLENDER_VERSION.tar.xz $BLENDER_URL \
 && tar -xvf /tmp/blender-$BLENDER_VERSION.tar.xz -C /opt/ \
 && rm /tmp/blender-$BLENDER_VERSION.tar.xz \
 && ${BLENDER_PYTHON_BIN} -m ensurepip \
 && ${BLENDER_PYTHON_BIN} -m pip install --upgrade pip \
 && ${BLENDER_PYTHON_BIN} -m pip install --upgrade pillow pydantic dacite python-slugify \
 && chown -R $USER_NAME:$USER_NAME $BLENDER_INSTALL_DIR

# add blender to user's PATH
RUN echo "export PATH=$BLENDER_INSTALL_DIR:$PATH" >> /home/$USER_NAME/.bashrc

# add blender to user's aliases
RUN echo "alias blender='$BLENDER_BIN'" >> /home/$USER_NAME/.bash_aliases

####################
# NODE.JS

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

# default command
CMD ["node"]

####################
# APP DIR

# APP DIR HAS ALREADY BEEN CREATED IN THE BASE IMAGE

# create app directory
# RUN mkdir /app && chown $USER_NAME:$USER_NAME /app
# WORKDIR /app

# set default user
USER $USER_NAME