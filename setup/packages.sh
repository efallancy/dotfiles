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

  # Ruby tooling
  'rbenv'

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

  # Fuzzy Finder
  'ack'

  # File content output with syntax
  'bat'

  # Image manipulation
  'imagemagick'

  # AWS
  'awscli'

  # Data store / Messaging
  'kafka'
  'redis'

  # JSON query
  'jq'

  # Kubernetes
  'minikube'
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
install_openjdk adoptopenjdk8
install_packages

echo 'Package installation done 🌟'

