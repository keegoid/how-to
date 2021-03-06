#!/bin/bash

# install fzf and lua
sudo apt install fzf lua5.3

# add to .bashrc to install z.lua
export _ZL_ECHO=1
eval "$(lua ~/.local/bin/z.lua --init bash enhanced once fzf)"

# add aliases to .bash_aliases
alias zz='z -c'      # restrict matches to subdirs of $PWD
alias zi='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directory