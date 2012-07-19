PS1='\u@\h:\w $(vcprompt)\$ '

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# http://www.reddit.com/r/commandline/comments/kbeoe/you_can_make_readline_and_bash_much_more_user/
bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

for F in exports aliases functions; do
  F=$HOME/.$F
  [ -e "$F" ] && source $F
done

# dircolors
if [ "$TERM" != "dumb" ]; then
  eval `dircolors ~/.dir_colors`
fi

# Added by bootstrap.sh of isyncd.
WORKON_HOME=~/.virtualenvs
source virtualenvwrapper.sh

# Node
export NODE_PATH=/usr/local/lib/node_modules

# rbenv
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

# autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi
