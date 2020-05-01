#!/bin/bash

# VMware tools
yum install -y open-vm-tools

# prerequisites
# 1. Insert VMware tools CD

VMWARE_INSTALL_DIR=/var/vmware-tools

mkdir -p /media/cdrom
mount /dev/sr0 /media/cdrom
pushd /media/cdrom
mkdir -p ${VMWARE_INSTALL_DIR}
cp VMwareTools-* ${VMWARE_INSTALL_DIR}
cd ${VMWARE_INSTALL_DIR}
tar xzf VMwareTools-*
cd vmware-tools-distrib
./vmware-install.pl -d -f
popd
rm -f ${VMWARE_INSTALL_DIR}/*.tar.gz

# enable automatic kernel updates, enter
# vmware-config-tools.pl
