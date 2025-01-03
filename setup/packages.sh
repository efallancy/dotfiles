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
  'clojure-lsp'
  'borkdude/brew/babashka'

  # Go tooling
  'go'

  # Ruby tooling
  'rbenv'

  # Elixir tooling
  'elixir'

  # Python tooling
  'python'
  'pipx'

  # Haskell tooling
  'ghc'
  'cabal-install'
  'haskell-stack'

  # Editor
  'vim'
  'neovim'

  # Mainly for fuzzy finder
  'perl'
  'universal-ctags'

  # Fuzzy Finder
  'ack'
  'ripgrep'
  'fzf'
  'the_silver_searcher'

  # File content output with syntax
  'bat'

  # Image manipulation
  'imagemagick'

  # AWS
  'awscli'

  # Data store / Messaging
  'kafka'
  'redis'
  'postgresql@15'
  'sqlite'

  # JSON query
  'jq'

  # Kubernetes
  'minikube'
  'kubectx'
  'k9s'

  # Infra as code
  'terraform'
  'pulumi'

  # Rust toolchain - alias to `rustup`
  'rustup-init'
  'rust-analyzer'

  # OCaml
  'ocaml'
  'opam'

  # Shell lint (e.g.: bash script)
  'shellcheck'

  # Java LTS: 17
  # Requires symlinking
  'openjdk@17'

  # Lightweight Makefile
  'go-task'

  # AI
  'ollama'
)

cask_packages=(
  'google-chrome'

  '1password'

  'visual-studio-code'

  'iterm2'

  'rectangle'

  'firefox'

  'slack'

  'telegram'

  'docker'

  'zoom'

  'postman'

  'zed'

  'brave-browser'

  'tableplus'

  'ghostty'
)

tap_packages=(
  'bun'
)

for package in "${packages[@]}"; do
  echo "📦 $package"
done

for cask_package in "${cask_packages[@]}"; do
  echo "💾 $cask_package"
done

for tap_package in "${tap_packages[@]}"; do
  echo "🪄 $tap_package"
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

tap_packages () {
  echo 'Tapping Bun.sh'
  brew tap oven-sh/bun
}

# Installing all the packages
tap_packages
install_packages
install_cask_packages

echo 'Package installation done 🌟'
