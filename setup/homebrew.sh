#!/usr/bin/env bash

echo 'Homebrew-ing 🍺'

# Ref: https://brew.sh/
install_homebrew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

configure_brew_command () {
  echo 'eval "$(`which brew` shellenv)"' >> $HOME/.zprofile
  eval "$(`which brew` shellenv)"
}

# Validating if Homebrew is available
if [[ ! $(command -v brew) ]]; then
  echo 'Installing Homebrew 🍻'
  install_homebrew
  configure_brew_command
else
  echo 'Updating Homebrew 🔄'
  brew update

  echo 'Upgrading Homebrew packages 🔄'
  brew upgrade
fi

echo 'Homebrew is good for brewing 👍'

