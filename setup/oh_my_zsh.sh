#!/usr/bin/env bash

echo "Installing oh-my-zsh 🙏"

# Ref: https://github.com/ohmyzsh/ohmyzsh#unattended-install
install_oh_my_zsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

install_zsh_plugins () {
  # Syntax highlighting - Ref: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# Only install when current shell is ZSH
if [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "Performing unattended installation 🤖"

  if [[ -d ~/.oh-my-zsh ]]; then
    echo "oh-my-zsh already exists ..."
    echo "Skipping oh-my-zsh installation 😅"
  else
    install_oh_my_zsh
    install_zsh_plugins
  fi
else
  echo "Shell is not configured as ZSH ℹ️ "
  echo "Fail to install oh-my-zsh ❌"
  echo "Skipping oh-my-zsh installation 😅"
fi

