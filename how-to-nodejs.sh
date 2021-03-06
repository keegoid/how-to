
#!/bin/bash

# install nvm to manage node versions
curl -o- "https://raw.githubusercontent.com/creationix/nvm/v0.37.2/install.sh" | bash

# source nvm
\. ~/.nvm/nvm.sh

# install highest lts node version
nvm install lts/*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# check which node and npm
which node
which npm

# check versions
node -v
npm -v

# switch to new version copying modules from old version
nvm install lts/erbium --reinstall-packages-from=12.16.1
nvm alias default lts/erbium
nvm ls