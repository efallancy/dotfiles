#!/usr/bin/env bash

echo 'Preparing to install packages 🎁'

# Installing packages using Homebrew
if [[ ! $(command -v brew) ]]; then
  echo 'Homebrew is required for installing packages...'
  echo 'Please install Homebrew or follow this link ➡️  https://brew.sh/'
  exit 1
fi

echo 'Picking up the list 📥'

packages=(
  # Git - of course
  'git'

  # Node stuffs
  'nvm'
  'yarn'

  # Clojure tooling
  'clojure'
  'leiningen'

  # Go tooling
  'go'
  'dep'

  # Elixir tooling
  'elixir'

  # Python tooling
  'python'

  # Haskell tooling
  'ghc'
  'cabal-install'
  'haskell-stack'

  # Editor
  'vim'
)

for package in "${packages[@]}"; do
  echo "📦 $package"
done

# Package installation
install_packages () {
  echo 'Installing packages...'
  brew install ${packages[@]}
}

# Java installation using OpenJDK
install_openjdk () {
  echo 'Tapping into OpenJDK...'
  brew tap AdoptOpenJDK/openjdk
  brew cask install $1
}

# Installing all the packages
install_packages
install_openjdk adoptopenjdk8

echo 'Package installation done 🌟'

