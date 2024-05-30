#!/usr/bin/env bash

echo "Perform postinstall move 💃"

# zshrc
if [[ "$SHELL" == "/bin/zsh" ]]; then
  cp ./config/zshrc ~/.zshrc
  echo "zshrc file added ✅"
fi

# vim
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "Vundle installed ✅"
else
  echo "Vundle exists 👍"
fi

cp ./config/vimrc ~/.vimrc
echo "vimrc file added ✅"

# Create config folder
mkdir -p ~/.config

# neovim
cp -R ./config/nvim ~/.config
echo "neovim configuration added ✅"

echo "All set! 🛩"
