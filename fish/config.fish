# Virtualfish
eval (python -m virtualfish)

###########
# Exports #
###########

set -x LS_OPTIONS="--color=auto"

# Prefer US English and use UTF-8
set -x LC_ALL="en_US.UTF-8"
set -x LANG="en_US"

# vim as default editor
set -x VISUAL=vim
set -x EDITOR=vim

# .bin
set -x PATH=$PATH:$HOME/.bin:$HOME/.local/bin

# Node
set -x NODE_PATH=/usr/local/lib/node_modules
set -x PATH=$PATH:/usr/local/share/npm/bin

# GOPATH
set -x GOPATH=$HOME/go
set -x PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# rbenv
set -x PATH=$HOME/.rbenv/bin:$PATH

# docker
set -x DOCKER_TLS_VERIFY=1
set -x DOCKER_CERT_PATH=$HOME/.docker
set -x DOCKER_HOST="tcp://127.0.0.1:2376"

# heroku
set -x PATH="/usr/local/heroku/bin:$PATH"

###########
# Aliases #
###########

alias ..="cd .."
alias l="ls -al"
alias git="hub"
alias fig="docker-compose"
alias fig-prod="docker-compose -f docker-compose-prod.yml"
alias fig-test="docker-compose -f docker-compose-test.yml"

#############
# Functions #
#############

function tarsnap-backup
  tarsnap -v --humanize-numbers -c -f (realpath "$1")(date -u +%s) $1
end
