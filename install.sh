#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -r $HOME/dotfiles/.oh-my-zsh/custom $HOME/.oh-my-zsh/
cp $HOME/dotfiles/.zshrc $HOME/.zshrc
# cp ./gri /usr/local/bin/gri
