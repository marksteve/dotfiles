PS1='\u@\h:\w $(vcprompt)\$ '

shopt -s nocaseglob

# http://www.reddit.com/r/commandline/comments/kbeoe/you_can_make_readline_and_bash_much_more_user/
bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'

for F in exports aliases functions; do
  F=$HOME/.$F
  [ -e "$F" ] && source $F
done

# dircolors
if [ "$TERM" != "dumb" ]; then
  eval `dircolors ~/.dir_colors`
fi

# setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`/bin/ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`/bin/ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# Added by bootstrap.sh of isyncd.
WORKON_HOME=~/.virtualenvs
source virtualenvwrapper.sh

# Initialize the 'hop' script
source /Library/Python/2.6/site-packages/Hop-1.0-py2.6.egg/hop/hop.bash

# Node
export PATH=$HOME/.local/node/bin:$PATH
export NODE_PATH=$HOME/.local/lib/node:$HOME/local/node/lib/node_modules

# rbenv
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
