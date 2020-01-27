#!/usr/bin/env bash

echo 'Homebrew-ing 🍺'

# Ref: https://brew.sh/
install_homebrew () {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# Validating if Homebrew is available
if [[ ! $(command -v brew) ]]; then
  echo 'Installing Homebrew 🍻'
  install_homebrew
else
  echo 'Updating Homebrew 🔄'
  brew update

  echo 'Upgrading Homebrew packages 🔄'
  brew upgrade
fi

echo 'Homebrew is good for brewing 👍'

