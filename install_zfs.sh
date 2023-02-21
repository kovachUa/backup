#!/bin/bash

# Add the backports repository
echo "deb http://deb.debian.org/debian bullseye-backports main contrib" > /etc/apt/sources.list.d/bullseye-backports.list
echo "deb-src http://deb.debian.org/debian bullseye-backports main contrib" >> /etc/apt/sources.list.d/bullseye-backports.list

# Create the preferences file for the ZFS package
cat <<EOF > /etc/apt/preferences.d/90_zfs
Package: src:zfs-linux
Pin: release n=bullseye-backports
Pin-Priority: 990
EOF

# Update the package index and install the necessary packages
apt-get update
apt-get install -y dpkg-dev linux-headers-generic linux-image-generic zfs-dkms zfsutils-linux
