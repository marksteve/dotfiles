## Install

```sh
git clone https://github.com/marksteve/dotfiles
cd dotfiles
./install.sh
git submodule update --init
```

## Update submodules

```sh
./update.sh
```

## OSX

### Homebrew

```sh
brew tap marksteve/personal
brew install \
  ack \
  bash-completion \
  git \
  gnupg \
  go \
  macvim \
  mercurial \
  ngrok \
  node \
  realpath \
  tarsnap \
  terraform
brew install caskroom/cask/brew-cask
```

### Cask

```sh
brew cask install \
  boot2docker \
  caffeine \
  dropbox \
  firefox \
  github \
  google-chrome \
  imageoptim \
  iterm2 \
  jumpcut \
  keepassx \
  licecap \
  mplayerx \
  plotdevice \
  slack \
  spectacle \
  spotify \
  steam \
  utorrent
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

