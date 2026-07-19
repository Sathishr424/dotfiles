#!/bin/bash

echo "Setting things up..."

sudo rm -rf ~/.tmux.conf
sudo rm -rf ~/.p10k.zsh
sudo rm -rf ~/.vimrc
sudo rm -rf ~/.zshrc
sudo rm -rf ~/.config/hypr/hyprland.lua

sudo ln -s ~/Documents/dotfiles/.tmux.conf ~/.tmux.conf
sudo ln -s ~/Documents/dotfiles/.p10k.zsh ~/.p10k.zsh
sudo ln -s ~/Documents/dotfiles/.vimrc ~/.vimrc
sudo ln -s ~/Documents/dotfiles/.zshrc ~/.zshrc
sudo ln -s ~/Documents/dotfiles/hyprland.lua ~/.config/hypr/hyprland.lua
