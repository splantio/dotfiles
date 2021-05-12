#!/bin/zsh

dotfiles_dir=$0:A:h

install_oh_my_zsh () {
  local install_location="$HOME/.oh-my-zsh"
  if [[ -d $install_location ]]; then
    return 0
  else
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended  > /dev/null 2>&1
  fi

  cp $dotfiles_dir/.oh-my-zsh/custom/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/custom/themes
  cp $dotfiles_dir/.zshrc $HOME
  source $HOME/.zshrc
}

install_gri () {
  local install_location="/usr/local/bin/gri"
  if [[ -f $install_location ]]; then
    return 0
  fi

  # Notify if user is not root
  if [ "$EUID" -ne 0 ]; then 
    echo "Installing gri"
    sudo cp $dotfiles_dir/gri /usr/local/bin
  fi
}

install_vs_code_settings () {
  local vs_code_user_directory="$HOME/Library/Application Support/Code/User"
  if [[ -d $vs_code_user_directory ]]; then
    echo "Installing VS Code settings"
    cp "$dotfiles_dir/VS Code/settings.json" $vs_code_user_directory
  fi
}

install_oh_my_zsh
install_gri
install_vs_code_settings