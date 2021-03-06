#!/bin/bash

cat <<EOF | lxc profile edit default
description: Default LXD profile
devices:
  eth0:
    name: eth0
    nictype: bridged
    parent: br0
    type: nic
  root:
    path: /
    pool: default
    type: disk
EOF

lxc profile create gui
cat <<EOF | lxc profile edit gui
config:
  environment.DISPLAY: :0
  raw.idmap: both 1000 1000
  user.user-data: |
    #cloud-config
    runcmd:
      - 'sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf'
      - 'echo export PULSE_SERVER=unix:/tmp/.pulse-native | tee --append /home/ubuntu/.profile'
    packages:
      - x11-apps
      - mesa-utils
      - pulseaudio
description: GUI LXD profile
devices:
  PASocket:
    path: /tmp/.pulse-native
    source: /run/user/1000/pulse/native
    type: disk
  X0:
    path: /tmp/.X11-unix/X0
    source: /tmp/.X11-unix/X0
    type: disk
  mygpu:
    type: gpu
name: gui
used_by:
EOF

lxc launch -p default -p gui ubuntu:19.10 subl1910
lxc config device add subl1910 eth0 nic nictype=bridged parent=br0 name=eth0
lxc restart subl1910

# or

lxc launch ubuntu:19.10 subl1910
lxc config device add subl1910 eth0 nic nictype=bridged parent=br0 name=eth0
lxc profile assign subl1910 default,gui
lxc restart subl1910

lxc exec subl1910 -- sudo --user ubuntu --login
tail -10 /var/log/cloud-init.log
glxgears
pactl info

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text