#/bin/bash

E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'

for F in bashrc bash_profile exports aliases functions vim; do
  [ -e "`pwd`/$F" ] && ([ ! -e "$HOME/.$F" ] && ln -s `pwd`/$F $HOME/.$F && echo -e .$F $I$R) || echo -e .$F $E$R
done

for F in vimrc gvimrc; do
  [ -e "`pwd`/vim/$F" ] && ([ ! -e "$HOME/.$F" ] && ln -s `pwd`/vim/$F $HOME/.$F && echo -e .$F $I$R) || echo -e .$F $E$R
done

