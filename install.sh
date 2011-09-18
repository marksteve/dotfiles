#/bin/bash
E='\033[1;30m[exists]'
I='\033[1;32m[installed]'
R='\033[0m'
for F in bashrc bash_profile exports aliases functions vim; do
  [ -e "`pwd`/$F" ] && ([ ! -e "$HOME/.$F" ] && ln -s `pwd`/$F $HOME/.$F && echo -e .$F $I$R) || echo -e .$F $E$R
done
IV=`pwd`/vim/vimrc
EV=$HOME/.vimrc
[ -e "$IV" ] && ([ ! -e "$EV" ] && ln -s $IV $EV && echo -e .vimrc $I$R) || echo -e .vimrc $E$R
