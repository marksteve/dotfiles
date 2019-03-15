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

if [[ `uname` == 'Linux' ]]; then
  OS='linux'
else
  OS='osx'
fi

install $OS/exports .exports
install aliases .aliases
install functions .functions
install zshrc .zshrc
install zpreztorc .zpreztorc
install dircolors .dircolors

mkdir -p $HOME/.local/bin
for file in `pwd`/localbin/*
do
  if [[ -x $file ]]; then
    install localbin/$(basename $file) .local/bin/$(basename $file)
  fi
done

install vim .vim
install vim/vimrc .vimrc
install vim/gvimrc .gvimrc

install tmux.conf .tmux.conf
install ackrc .ackrc
install gitconfig .gitconfig
install gitignore .gitignore
install tigrc .tigrc
install tarsnaprc .tarsnaprc
install gemrc .gemrc
install tool-versions .tool-versions
install pycodestyle .config/pycodestyle
install gpg-agent.conf .gnupg/gpg-agent.conf
