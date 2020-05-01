FROM ubuntu-base
MAINTAINER "Ralph Wiedemeier" <ralph@framefactory.ch>
LABEL description="Ubuntu Node Image"
LABEL version="0.1"

# Install provisioning scripts
COPY scripts/* /var/provisioning/
WORKDIR /var/provisioning

RUN apt-get update \
 && apt-get install -y apt-utils \
 && apt-get install -y dos2unix && dos2unix *

# Run provisioning scripts
RUN ./ubuntu-node-install.sh
RUN ./ubuntu-ssh-install.sh

# Create volumes
VOLUME /data
VOLUME /key

# Copy private key
RUN cp ~/.ssh/id_rsa /key

# Set startup directory
WORKDIR /

# Cleanup
RUN apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
