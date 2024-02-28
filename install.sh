#!/usr/bin/env zsh

setopt +o nomatch

E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'

install () {
  if [ -e "$HOME/$2" ]; then
    echo $2 $E$R
    read -q "CONFIRM?Replace existing? (y/n) "
    echo
  fi
  if ([ ! -e "$HOME/$2" ] || [[ $CONFIRM =~ ^[Yy]$ ]]); then
    rm -r $HOME/$2 > /dev/null 2>&1
    ln -s `pwd`/$1 $HOME/$2 && echo $2 $I$R
  fi
  echo
}

if [[ `uname` == 'Linux' ]]
then
  if [[ `uname -r` == *-microsoft-standard ]]
  then
    OS='wsl'
  else
    OS='linux'
  fi
else
  OS='macos'
fi

# Shell config
install os/$OS/exports .exports
install aliases .aliases
install functions .functions
install zshrc .zshrc
install dircolors .dircolors

# Local bins
mkdir -p $HOME/.local/bin
for file in `pwd`/localbin/*
do
  if [[ -x $file ]]; then
    install localbin/$(basename $file) .local/bin/$(basename $file)
  fi
done

# Systemd units
mkdir -p $HOME/.config/systemd/user
for file in `pwd`/systemd/*
do
  if [[ -x $file ]]; then
    install systemd/$(basename $file) .config/systemd/user/$(basename $file)
  fi
done

# Vim config
install vim .config/nvim
install vim .vim
install vim/vimrc .vimrc
install vim/gvimrc .gvimrc

# Misc
install ackrc .ackrc
install alacritty.yml .alacritty.yml
install gemrc .gemrc
install gitconfig .gitconfig
install gitignore .gitignore
install mise.toml .config/mise/config.toml
install os/$OS/gpg-agent.conf .gnupg/gpg-agent.conf
install pycodestyle .config/pycodestyle
install tarsnaprc .tarsnaprc
install tigrc .tigrc
install tmux.conf .tmux.conf

