#!/bin/sh

# install pipx
brew install pipx

# tab completion for pipx
pipx completions >> ~/.bashrc

# install virtualenv
pipx install virtualenv

# make cli-ve for pip
virtualenv ~/cli-ve

# install from python requirements file
pip install -r ~/conf/pip-ls

# upgrade pip
~/cli-ve/bin/python3 -m pip install --upgrade pip

# activate cli-ve for use with pip3
. activate

# deactivate cli-ve
deactivate

# how to update all pips needing updates
pip3 install -U $(pip3 list -o | awk '{ print $1 }' | tail -n +3)
