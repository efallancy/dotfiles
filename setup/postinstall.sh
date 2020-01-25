#!/usr/bin/env bash

echo "Perform postinstall move 💃"

# Perform path sourcing when shell is ZSH
if [[ "$SHELL" == "/bin/zsh" ]]; then
  # NVM
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zshrc
  echo "  . \"/usr/local/opt/nvm/nvm.sh\"" >> ~/.zshrc

  # Go
  echo "export GOPATH=\"$HOME/go\"" >> ~/.zshrc
fi

echo "All set! 🛩"
