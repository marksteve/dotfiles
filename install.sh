#!/usr/bin/env zsh

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
install zpreztorc .zpreztorc
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
install vim .vim
install vim/vimrc .vimrc
install vim/gvimrc .gvimrc

# Misc
install tmux.conf .tmux.conf
install ackrc .ackrc
install gitconfig .gitconfig
install gitconfig-work .gitconfig-work
install gitignore .gitignore
install tigrc .tigrc
install tarsnaprc .tarsnaprc
install gemrc .gemrc
install tool-versions .tool-versions
install pycodestyle .config/pycodestyle
install os/$OS/gpg-agent.conf .gnupg/gpg-agent.conf
install alacritty.yml .alacritty.yml
