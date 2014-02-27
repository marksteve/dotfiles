#/bin/bash

E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'

install () {
  if [ -e "$HOME/$2" ]; then
    echo -e $2 $E$R
    read -p "Replace existing? (y/n) " -n 1
    echo
  fi
  if ([ ! -e "$HOME/$2" ] || [[ $REPLY =~ ^[Yy]$ ]]); then
    rm -r $HOME/$2 > /dev/null 2>&1
    ln -s `pwd`/$1 $HOME/$2 && echo -e $2 $I$R
  fi
  echo
}

if [[ `uname` == 'Linux' ]]
then
  OS='linux'
else
  OS='osx'
fi

for F in bashrc bash_profile exports aliases functions; do
  install $OS/$F .$F
done

install dir_colors .dir_colors
install vim .vim
install vim/vimrc .vimrc
install vim/gvimrc .gvimrc
install tmux.conf .tmux.conf
install Xresources .Xresources
install xsession .xsession
