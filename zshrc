source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# asdf
if [ -d $HOME/.asdf ]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

# imports
for F in exports aliases functions; do
  F=$HOME/.$F
  [ -e "$F" ] && source $F
done

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# gcloud
if [ -d $HOME/.local/google-cloud-sdk ]; then
  # source $HOME/.local/google-cloud-sdk/completion.zsh.inc
  source $HOME/.local/google-cloud-sdk/path.zsh.inc
fi
if [ -d /usr/local/Caskroom/google-cloud-sdk ]; then
  # source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi

# direnv
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# fasd
command -v fasd >/dev/null && eval "$(fasd --init auto)"

# iterm2
[ -f $HOME/.iterm2_shell_integration.zsh ] && source $HOME/.iterm2_shell_integration.zsh

# pyenv
if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# hub
command -v hub >/dev/null && eval "$(hub alias -s)"

# envchain
if command -v envchain >/dev/null; then
  export $(envchain github env | grep GITHUB_TOKEN)
fi

# gnome-keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
