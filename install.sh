#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

# rm -rf $HOME/.config/kitty 
# ln -s $DOTFILES/kitty $HOME/.config/kitty
# ln -s /Applications/kitty.app/Contents/MacOS/kitty /usr/local/bin/kitty

rm -rf $HOME/.tmux.conf 
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.local/bin

rm -rf $HOME/.local/bin/t
ln -s $DOTFILES/scripts/t $HOME/.local/bin/t

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/alacritty
ln -s $DOTFILES/alacritty $HOME/.config/alacritty

rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

rm -f $HOME/.wezterm.lua
ln -s $DOTFILES/wezterm/wezterm.lua $HOME/.wezterm.lua

rm -rf $HOME/.config/ghostty/config
mkdir -p $HOME/.config/ghostty
ln -s $DOTFILES/ghostty/config $HOME/.config/ghostty/config

rm -rf $HOME/.config/nix
ln -s $DOTFILES/nix $HOME/.config/nix
