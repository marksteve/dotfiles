#/bin/bash
for F in bashrc bash_profile exports aliases functions vim; do
  [ -e "`pwd`/$FF" ] && [ ! -e "$HOME/.$F" ] && ln -s `pwd`/$F $HOME/.$F && echo Linked $F
done
