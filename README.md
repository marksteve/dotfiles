# dotfiles
> That's the Way (I Like It)

## Requirements

- zsh
- [prezto](https://github.com/sorin-ionescu/prezto)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fasd](https://github.com/clvv/fasd)
- [tpm](https://github.com/tmux-plugins/tpm)

### Ubuntu

1. Install dependencies
    ```
    sudo apt install zsh ripgrep fasd tmux direnv syncthing pinentry-gtk2
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
1. Install tpm plugins by running tmux then pressing `Ctrl + a, i`

### MacOS

1. Install brew
1. Install dependencies
    ```
    brew install zsh ripgrep fasd tmux direnv gpg envchain
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

## Install

```sh
git clone https://github.com/marksteve/dotfiles
cd dotfiles
git submodule update --init --recursive
./install.sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install tpm plugins by running tmux then pressing `Ctrl + a, i` after installing dotfiles

## Ubuntu

### Alacritty

1. Follow [install instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
1. Set as default terminal
    ```
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
    sudo update-alternatives --config x-terminal-emulator
    ```
## MacOS

### gocryptfs
1. Install dependencies
    ```
    brew install go openssl@1.1 pkg-config
    brew install --cask macfuse
    ```
1. Clone gocryptfs in ~/Downloads
1. Patch it with:
    ```
    diff --git a/go.mod b/go.mod
    index 64ab6e5..62ec237 100644
    --- a/go.mod
    +++ b/go.mod
    @@ -17,3 +17,5 @@ require (
            golang.org/x/net v0.0.0-20200324143707-d3edc9973b7e // indirect
            golang.org/x/sys v0.0.0-20200501145240-bc7a7d42d5c3
     )
    +
    +replace github.com/hanwen/go-fuse/v2 v2.0.4-0.20201104153454-be8e5f4a85fd => "/Users/marksteve/Downloads/go-fuse/"
    ```
    _Taken from https://github.com/rfjakob/gocryptfs/issues/524_
1. Clone go-fuse in ~/Downloads
1. Go inside gocryptfs and run `build.bash`
1. Mount secrets: `~/go/bin/gocryptfs ~/Sync/.secrets.enc ~/.secrets`. This will warn you to update security policy to enable external system extensions.

## WSL

### Setup systemd with genie

```
sudo su -

# add Microsoft repo with .Net 3.1 runtime
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

# https://arkane-systems.github.io/wsl-transdebian/
wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg
chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg
cat << EOF > /etc/apt/sources.list.d/wsl-transdebian.list
deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
EOF
apt update

apt install systemd-genie
```

Instructions taken from https://kumekay.com/wsl2-and-systemd/

## Secrets

```
mkdir ~/.secrets
mount-secrets
rm -rf ~/.ssh
ln -s ~/.secrets/ssh ~/.ssh
gpg --import ~/.secrets/gpg/secret.asc
gpg --import-ownertrust ~/.secrets/gpg/ownertrust.txt
```

### MacOS

Store SSH private key passphrase in keychain:

```
ssh-add -AK
```

## Python

### Versions
```
curl https://pyenv.run | bash
```

### Global Packages
```
pip3 install --user pipx
cat requirements.in | xargs -I '{}' pipx install {}
```

## Node

```
curl https://get.volta.sh | bash
volta install node yarn
```
