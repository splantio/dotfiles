#!/bin/zsh

dotfiles_dir=$0:A:h

install_oh_my_zsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended  > /dev/null 2>&1
  cp $dotfiles_dir/.oh-my-zsh/custom/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/custom/themes
  cp $dotfiles_dir/.zshrc $HOME
  source $HOME/.zshrc
}

install_gri () {
  # Notify if user is not root
  if [ "$EUID" -ne 0 ]; then 
    echo "To install gri in /usr/local/bin, your password is needed:"
  fi
  sudo cp $dotfiles_dir/gri /usr/local/bin
}

install_oh_my_zsh
install_gri