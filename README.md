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

1. Install brew and port
1. Install dependencies
    ```
    brew install zsh ripgrep fasd tmux direnv gpg envchain
    port install gocryptfs
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
