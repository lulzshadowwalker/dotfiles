#!/usr/bin/env bash

DOTFILES=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

rm -rf $HOME/.config/kitty 
ln -s $DOTFILES/kitty $HOME/.config/kitty
ln -s /Applications/kitty.app/Contents/MacOS/kitty /usr/local/bin/kitty

rm -rf $HOME/.tmux.conf 
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# rm -rf $HOME/.config/nvim
# ln -s $DOTFILES/nvim $HOME/.config/nvim

# rm -rf $HOME/.config/phpactor
# ln -s $DOTFILES/phpactor $HOME/.config/phpactor

rm -rf $HOME/.config/ghostty/config
mkdir -p $HOME/.config/ghostty
ln -s $DOTFILES/ghostty/config $HOME/.config/ghostty/config