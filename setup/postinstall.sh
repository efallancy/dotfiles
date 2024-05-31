#!/usr/bin/env bash

echo "Perform postinstall move 💃"

# zshrc
if [[ "$SHELL" == "/bin/zsh" ]]; then
  if [[ ! -f ~/.zshrc ]]; then
    cp ./config/zshrc ~/.zshrc
    echo "zshrc file added ✅"
  else
    echo "zshrc file exists and no action needed 👍"
  fi
fi

# vim
if [[ ! -d ~/.vim/autoload/plug.vim ]]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "vim-plug intalled ✅"
else
  echo "vim-plug exists 👍"
fi

cp ./config/vimrc ~/.vimrc
echo "vimrc file added ✅"

# Create config folder
mkdir -p ~/.config

# neovim
cp -R ./config/nvim ~/.config
echo "neovim configuration added ✅"

echo "All set! 🛩"
