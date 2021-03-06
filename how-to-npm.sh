#!/bin/sh

# get list of globally installed modules
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > ~/conf/npm-ls

# reinstall them on another system
xargs npm install --global < ~/conf/npm-ls

# install node packages to project directory
npm install

# install node packages globally for current node version being used
npm install -g
