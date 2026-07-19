#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting things up..."
echo "Dotfiles directory: $DOTFILES_DIR"

rm -f ~/.tmux.conf
rm -f ~/.p10k.zsh
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.config/hypr/hyprland.lua

ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/.p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/hyprland.lua" ~/.config/hypr/hyprland.lua

echo "Done!"
