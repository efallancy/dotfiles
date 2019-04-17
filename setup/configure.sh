#!/usr/bin/env bash

# Refer: http://redsymbol.net/articles/unofficial-bash-strict-mode/
echo 'Configuring ⚙️'

# Set non-zero exit code failure handler
set -euo pipefail

# Whitespace evaluation
IFS=$'\n\t'

# Initialise .bash_profile if not yet created
init_bash_profile () {
  echo "export PS1=\"\u > \W\n\\\$ \[\$(tput sgr0)\]\"" >> ~/.bash_profile
  
  # NVM
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bash_profile
  echo "  . \"/usr/local/opt/nvm/nvm.sh\"" >> ~/.bash_profile

  # Go
  echo "export GOPATH=\"$HOME/go\"" >> ~/.bash_profile
}

# Create .bash_profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  echo 'Initialising .bash_profile'
  init_bash_profile
else
  echo 'File exists: ~/.bash_profile'
fi

# Create .bashrc
if [[ ! -e "$HOME/.bashrc" ]]; then
  echo '' >> ~/.bashrc
else
  echo 'File exists: ~/.bashrc'
fi

