# Virtualfish
eval (python -m virtualfish)

###########
# Exports #
###########

set -xg LS_OPTIONS "--color auto"

# Prefer US English and use UTF-8
set -xg LC_ALL "en_US.UTF-8"
set -xg LANG "en_US"

# vim as default editor
set -xg VISUAL vim
set -xg EDITOR vim

# .bin
set -xg PATH $PATH:$HOME/.bin:$HOME/.local/bin

# Node
set -xg NODE_PATH /usr/local/lib/node_modules
set -xg PATH $PATH:/usr/local/share/npm/bin

# GOPATH
set -xg GOPATH $HOME/go
set -xg PATH $PATH:/usr/local/go/bin:$GOPATH/bin

# rbenv
set -xg PATH $HOME/.rbenv/bin:$PATH

# docker
set -xg DOCKER_TLS_VERIFY 1
set -xg DOCKER_CERT_PATH $HOME/.docker
set -xg DOCKER_HOST "tcp://127.0.0.1:2376"

# heroku
set -xg PATH "/usr/local/heroku/bin:$PATH"

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
