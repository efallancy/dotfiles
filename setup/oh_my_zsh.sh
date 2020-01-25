#!/usr/bin/env bash

echo "Installing oh-my-zsh 🙏"

# Ref: https://github.com/ohmyzsh/ohmyzsh#unattended-install
install_oh_my_zsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

# Only install when current shell is ZSH
if [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "Performing unattended installation 🤖"
  install_oh_my_zsh
else
  echo "Shell is not configured as ZSH ℹ️ "
  echo "Fail to install oh-my-zsh ❌"
  echo "Skipping oh-my-zsh installation 😅"
fi

