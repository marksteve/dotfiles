# imports
for F in aliases exports functions; do
  F=$HOME/.$F
  [ -e "$F" ] && source $F
done

# emacs bindings
bindkey -e

# starship
eval "$(starship init zsh)"

# mise
MISE_NODE_COREPACK=true
[ -f ~/.local/bin/mise ] && eval "$(~/.local/bin/mise activate zsh)"

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

# rye
[ -f $HOME/.rye/env ] && source $HOME/.rye/env

# hub
command -v hub >/dev/null && eval "$(hub alias -s)"

# keychain
if command -v keychain >/dev/null; then
  keychain $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOSTNAME-sh
fi

# atuin
command -v atuin >/dev/null && eval "$(atuin init zsh)"
