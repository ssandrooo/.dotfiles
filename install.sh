#!/bin/sh
set -e

echo '> getting zsh and git config <'
ln -sf ~/.dotfiles/configs/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/configs/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/configs/.gitconfig ~/.gitconfig

echo '> updating everything <'
sudo pacman -Syu

clear

echo '> getting must have packages <'
sudo pacman -S \
    base-devel \
    curl \
    wget

echo '> getting rid of bash <'
sudo pacman -S \
    zsh \
    zsh-completions

echo '> getting ~basic~ programming needs <'
sudo pacman -S \
    git \
    neovim \
    tmux

echo '> getting docker <'
sudo pacman -S \
    docker \
    docker-compose

# Docker extra - start

# add current user to docker group
sudo usermod -aG docker $USER

# enable service
# sudo systemctl enable docker.service

# Docker extra - end

echo '> getting utilities <'
sudo pacman -S \
    btop \
    fastfetch \
    ffmpeg

echo '> time for yay <'
git clone https://aur.archlinux.org/yay-bin.git 
cd yay-bin 
makepkg -si
cd ..
rm -rf ./yay-bin

# setting up db
yay -Y --gendb

echo '> installing packages from aur <'
yay -S \
    asdf-vm \
    ngrok

# rip bash
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.bash_profile ] && rm ~/.bash_profile
[ -f ~/.bash_history ] && rm ~/.bash_history
[ -f ~/.bash_logout ] && rm ~/.bash_logout

echo '> setup complete! switching to zsh... <'
chsh -s $(which zsh)
exec zsh