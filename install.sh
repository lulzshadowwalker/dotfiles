#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

rm -rf $HOME/.config/kitty 
ln -s $DOTFILES/kitty $HOME/.config/kitty
ln -s /Applications/kitty.app/Contents/MacOS/kitty /usr/local/bin/kitty

rm -rf $HOME/.tmux.conf 
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor
