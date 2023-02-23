#!/bin/bash

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
# This procedure works for Debian on x86_64 / amd64, armhf, arm64, and Raspbian.

# Update the apt package index
apt-get update

# Install Docker Engine, containerd, and Docker Compose.
# Latest version
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin

# Create the docker group.
groupadd docker

# Add your user to the docker group.
usermod -aG docker $USER

# Log out and log back in so that your group membership is re-evaluated.
# If you’re running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
# You can also run the following command to activate the changes to groups.
newgrp docker

# Verify that you can run docker commands without sudo.
docker run hello-world

# Install Docker Compose using the repository
# Set up the repository
# Find distro-specific instructions in: Ubuntu | CentOS | Debian | Fedora | RHEL | SLES.

# Update the package index, and install the latest version of Docker Compose for Ubuntu and Debian
apt-get update
apt-get install docker-compose-plugin

# Update the package index, and install the latest version of Docker Compose for RPM-based distros
yum update
yum install docker-compose-plugin

# Verify that Docker Compose is installed correctly by checking the version.
docker compose version

# To update the Compose plugin, run the following commands for Ubuntu and Debian
apt-get update
apt-get install docker-compose-plugin
