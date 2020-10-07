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
  'neovim'

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

  # Terraform
  'terraform'

  # Rust toolchain
  'rustup'
)

cask_packages=(
  'google-chrome'

  '1password'

  'visual-studio-code'
  
  'iterm2'

  'adoptopenjdk/openjdk/adoptopenjdk8'

  'spectacle'
)

for package in "${packages[@]}"; do
  echo "📦 $package"
done

for cask_package in "${cask_packages[@]}"; do
  echo "💾 $cask_package"
done

# Package installation
install_packages () {
  echo 'Installing packages...'
  brew install ${packages[@]}
}

install_cask_packages () {
  echo 'Installing cask packages...'
  brew cask install ${cask_packages[@]}
}

# Java installation using OpenJDK
tap_openjdk () {
  echo 'Tapping into OpenJDK...'
  brew tap AdoptOpenJDK/openjdk
}

# Installing all the packages
# tap_openjdk
install_packages
install_cask_packages

echo 'Package installation done 🌟'

