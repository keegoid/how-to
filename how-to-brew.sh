#!/bin/bash

# install brew on linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew completions
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"