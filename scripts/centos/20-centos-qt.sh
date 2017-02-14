#!/bin/bash

# install Qt libraries and tools
yum install -y qt-devel.x86_64 qt5-qtbase-devel.x86_64 qt5-qttools-devel.x86_64
echo 'pathmunge /usr/lib64/qt5/bin' > /etc/profile.d/qt.sh
. /etc/profile
