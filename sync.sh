#!/usr/bin/bash

# Neovim
rm -rf nvim
cp -r ~/.config/nvim .

# Ghostty
rm -rf ghostty
cp -r ~/.config/ghostty .

# yazi
rm -rf yazi
cp -r ~/.config/yazi .

# Zsh
rm -rf zshrc
cp ~/.zshrc zshrc

# Tmux
rm -rf tmux
cp -r ~/.config/tmux .
rm tmux.sh
cp ~/.tmux.sh tmux.sh

# hyprland
rm -rf hypr
cp -r ~/.config/hypr .

# waybar
rm -rf waybar
cp -r ~/.config/waybar .
