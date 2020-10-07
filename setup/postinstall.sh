#!/usr/bin/env bash

echo "Perform postinstall move 💃"

# zshrc
if [[ "$SHELL" == "/bin/zsh" ]]; then
  cp ./templates/zshrc ~/.zshrc
  echo "zshrc file added ✅"
fi

# vim
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "Vundle installed ✅"
else
  echo "Vundle exists 👍"
fi

# neovim
mkdir -p ~/.config/nvim

cp ./templates/vimrc ~/.vimrc
echo "vimrc file added ✅"

cp ./templates/nvimrc ~/.config/nvim/init.vim
echo "init.vim file added ✅"

echo "All set! 🛩"
