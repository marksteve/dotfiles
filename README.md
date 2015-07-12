## Install

```sh
git clone https://github.com/marksteve/dotfiles
cd dotfiles
./install.sh
```

## OSX

### Homebrew

```sh
brew tap homebrew/services
brew tap marksteve/personal
brew install \
  ack \
  bash-completion \
  git \
  gnupg \
  go \
  hub \
  macvim \
  mercurial \
  ngrok \
  node \
  realpath \
  tarsnap \
  the_silver_searcher \
  tig \
  zsh
brew install caskroom/cask/brew-cask
```

### Cask

```sh
brew cask install \
  caffeine \
  dropbox \
  firefox \
  github \
  google-chrome \
  handbrake \
  imageoptim \
  iterm2 \
  keepassx \
  licecap \
  lunchy \
  mplayerx \
  sidestep \
  slack \
  spectacle \
  spotify \
  steam \
  transmission
```

### Python

```sh
sudo easy_install pip
pip install --user virtualenv isort
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
pipsi install frosted
pipsi install pep8
pipsi install ipython[notebook]
```

