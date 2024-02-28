# dotfiles
> That's the Way (I Like It)

## Requirements

- zsh
- [starship](https://starship.rs/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fasd](https://github.com/clvv/fasd)
- [tpm](https://github.com/tmux-plugins/tpm)

### Ubuntu

1. Install dependencies
    ```
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    sudo apt install zsh ripgrep fasd tmux direnv syncthing pinentry-gtk2 gocryptfs keychain
    ```

### MacOS

1. Install brew and port
1. Install dependencies
    ```
    eval $(/opt/homebrew/bin/brew shellenv)
    brew install zsh starship ripgrep fasd tmux direnv syncthing gpg
    brew install \
        actual \
        bitwarden \
        boop \
        cloudflare-warp \
        google-chrome \
        iterm2 \
        netnewswire \
        obsidian \
        rectangle \
        restic \
        spotify \
        sublime-merge \
        telegram \
        todoist
    sudo port install gocryptfs
    sudo ln -fsn /opt/local/Library/Filesystems/macfuse.fs /Library/Filesystems/macfuse.fs
    ```

## Install

```sh
git clone https://github.com/marksteve/dotfiles
cd dotfiles
git submodule update --init --recursive
gpg # run to generate config directory
./install.sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install tpm plugins by running tmux then pressing `Ctrl + a, i` after installing dotfiles

## Secrets

```
mkdir ~/.secrets
mount-secrets
rm -rf ~/.ssh
ln -s ~/.secrets/ssh ~/.ssh
ln -s ~/.secrets/npmrc ~/.npmrc
gpg --import ~/.secrets/gpg/secret.asc
gpg --import-ownertrust ~/.secrets/gpg/ownertrust.txt
```

### MacOS

Store SSH private key passphrase in keychain:

```
ssh-add -K
```

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
curl https://mise.run | sh
mise install
```
