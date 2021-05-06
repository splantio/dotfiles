#!/bin/zsh

mydir=$0:A:h

do_ohmyzsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended  > /dev/null 2>&1
  cp $mydir/.oh-my-zsh/custom/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/custom/themes
  cp $mydir/.zshrc $HOME
}

do_ohmyzsh

source $HOME/.zshrc