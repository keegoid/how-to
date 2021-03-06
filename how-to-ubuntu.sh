#!/bin/bash
# how to Ubuntu

# install sources list to sources.list.d directory
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# set default terminal
sudo update-alternatives --config x-terminal-emulator

# set DHCP
sudo vi /etc/netplan/99_config.yaml

network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: true