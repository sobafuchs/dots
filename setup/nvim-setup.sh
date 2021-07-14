#!/bin/zsh

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

mv ~/.config/nvim ~/.config/nvim-bak
ln -s $DOTFILES_PATH/nvim ~/.config/nvim

echo "done!"
