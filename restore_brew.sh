#!/bin/sh

sudo pacman -Syu base-devel procps-ng curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
