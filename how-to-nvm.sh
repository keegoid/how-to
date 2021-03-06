#!/bin/bash

# nvm, node, and npm

# get nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# get list of lts versions
nvm ls-remote --lts

# install latest lts version of node and npm
nvm install lts/erbium

# reinstall packages from an older version
nvm install lts/erbium --reinstall-packages-from=12.16.1

# set default
nvm alias default lts/erbium

# set colors
nvm set-colors yMeBg

# switch to a specific node version
nvm use 12.14.0

# don't install npm with npm, let nvm do that with
nvm install-latest-npm

# copy packages from one version to another
nvm use 0.10.24; nvm copy-packages 0.10.23
