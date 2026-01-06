#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

rm -rf $HOME/.config/kitty 
ln -sf $DOTFILES/kitty $HOME/.config/kitty
ln -sf /Applications/kitty.app/Contents/MacOS/kitty /usr/local/bin/kitty

rm -rf $HOME/.tmux.conf 
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

rm -rf $HOME/.config/nvim
ln -sf $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/phpactor
ln -sf $DOTFILES/phpactor $HOME/.config/phpactor

rm -rf $HOME/.config/ghostty/config
mkdir -p $HOME/.config/ghostty
ln -sf $DOTFILES/ghostty/config $HOME/.config/ghostty/config