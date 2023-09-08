# My .dotfiles for Arch Linux (WSL)
Install script:
```
#!/bin/sh
# clone repo
git clone https://github.com/snaake20/.dotfiles ~/.dotfiles
# make symbolic links
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s .dotfiles/.bash_profile .bash_profile
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zprofile ~/.zprofile
# recover brew installs 
sh ~/.dotfiles/recover_brew.sh
sudo echo /home/linuxbrew/.linuxbrew/bin/zsh >> /etc/shells
chsh -s $(which zsh)
sudo pacman -S tmux
```

*... still WIP*
