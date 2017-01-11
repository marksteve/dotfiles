# antigen
source $HOME/Dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme wezm

antigen bundle colorize
antigen bundle copydir
antigen bundle copyfile
antigen bundle ssh-agent

antigen bundle supercrabtree/k

antigen apply

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

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

