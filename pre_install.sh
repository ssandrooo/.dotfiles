#!/bin/bash
set -e
sudo pacman -S git

git clone https://github.com/ssandrooo/.dotfiles ~/.dotfiles 

sh ~/.dotfiles/install.sh
