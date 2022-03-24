# imports
for F in aliases exports functions; do
  F=$HOME/.$F
  [ -e "$F" ] && source $F
done

# emacs bindings
bindkey -e

# starship
eval "$(starship init zsh)"

# asdf
if [ -d $HOME/.asdf ]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# direnv
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# fasd
command -v fasd >/dev/null && eval "$(fasd --init auto)"

# iterm2
[ -f $HOME/.iterm2_shell_integration.zsh ] && source $HOME/.iterm2_shell_integration.zsh

# pyenv
if command -v pyenv >/dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# hub
command -v hub >/dev/null && eval "$(hub alias -s)"

# gnome-keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# volta
if [ -d $HOME/.volta ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# genie
if command -v genie && [[ ! -v INSIDE_GENIE ]]; then
  exec /usr/bin/genie -s
fi