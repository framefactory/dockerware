# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH PYTHON

FROM ubuntu:22.04

# add user with UID 1000
ENV USER_NAME=main
RUN groupadd --gid 1000 $USER_NAME \
 && useradd --uid 1000 --gid $USER_NAME --shell /bin/bash --create-home $USER_NAME

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
RUN echo "alias ll='ls -lha' cda='cd /app'\nalias ..='cd ..'" >> /home/$USER_NAME/.bash_aliases

# create app directory
RUN mkdir /app && chown $USER_NAME:$USER_NAME /app
WORKDIR /app

# set default user
USER $USER_NAME
