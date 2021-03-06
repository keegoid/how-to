#!/bin/bash

# get list of apt packages installed manually
apt-mark showmanual > ~/conf/apt-ls

# install them
sudo xargs apt install < ~/conf/apt-ls