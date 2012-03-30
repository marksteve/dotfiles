#/bin/bash

E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'

for F in bashrc bash_profile exports aliases functions vim tmux.conf; do
  if [ -e "$HOME/.$F" ]; then
    echo -e .$F $E$R
    read -p "Replace existing? (y/n) " -n 1
    echo
  fi
  if ([ ! -e "$HOME/.$F" ] || [[ $REPLY =~ ^[Yy]$ ]]); then
    rm $HOME/.$F > /dev/null 2>&1
    ln -s `pwd`/$F $HOME/.$F && echo -e .$F $I$R
  fi
  echo
done

for F in vimrc gvimrc; do
  if [ -e "$HOME/.$F" ]; then
    echo -e .$F $E$R
    read -p "Replace existing? (y/n) " -n 1
    echo
  fi
  if ([ ! -e "$HOME/.$F" ] || [[ $REPLY =~ ^[Yy]$ ]]); then
    rm $HOME/.$F > /dev/null
    ln -s `pwd`/vim/$F $HOME/.$F && echo -e .$F $I$R
  fi
  echo
done
