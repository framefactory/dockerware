#!/bin/bash

# remove unused dependencies
yum autoremove -y
yum clean all

# remove temp stuff
rm -f /var/log/wtmp /var/log/btmp

# zero out drive
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# clear history
history -c