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

  # Clojure tooling
  'clojure'
  'leiningen'

  # Go tooling
  'go'

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
  'postgresql'
  'sqlite'

  # JSON query
  'jq'

  # Kubernetes
  'minikube'

  # Infra as code
  'terraform'
  'pulumi'

  # Rust toolchain - alias to `rustup`
  'rustup-init'

  # OCaml
  'ocaml'
  'opam'

  # Shell lint (e.g.: bash script)
  'shellcheck'

  # Scala build tool
  'coursier/formulas/coursier'
)

cask_packages=(
  'google-chrome'

  '1password'

  'visual-studio-code'
  
  'iterm2'

  'kap'

  # Current LTS: 17
  # Requires symlinking
  'openjdk@17'

  'rectangle'

  'firefox'

  'slack'

  'telegram'

  'docker'

  'zoom'
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
  brew install --cask ${cask_packages[@]}
}

# Installing all the packages
install_packages
install_cask_packages

echo 'Package installation done 🌟'

