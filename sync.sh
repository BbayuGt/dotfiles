#!/usr/bin/bash

# Neovim
rm -rf nvim
cp -r ~/.config/nvim .

# Rio
rm -rf rio
cp -r ~/.config/rio .

# Zsh
rm -rf zshrc
cp ~/.zshrc zshrc

# Tmux
rm -rf tmux
cp -r ~/.config/tmux .
rm tmux.sh
cp ~/.tmux.sh tmux.sh
