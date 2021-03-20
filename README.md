# dotfiles
> That's the Way (I Like It)

## Requirements

- zsh

    ```
    sudo apt install zsh
    ```

- [prezto](https://github.com/sorin-ionescu/prezto)

    ```
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

- [ripgrep](https://github.com/BurntSushi/ripgrep)

    ```
    sudo apt install ripgrep
    ```

- [fasd](https://github.com/clvv/fasd)

    ```
    sudo snap install fasd --beta
    ```

- [tpm](https://github.com/tmux-plugins/tpm)
    ```
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

    Run tmux and press `Ctrl + a, I` to install plugins.

## Install

```sh
git clone https://github.com/marksteve/dotfiles
git submodule update --init --recursive
cd dotfiles
./install.sh
```

## Ubuntu

1. Install dependencies
    ```
    sudo apt install ripgrep fasd tmux direnv pinentry-gtk2
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
1. Install tpm plugins by running tmux then pressing `Ctrl + a, i`

## Alacritty

1. Follow [install instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
1. Set as default terminal
    ```
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
    sudo update-alternatives --config x-terminal-emulator
    ```
## MacOS

1. Install brew
1. Install dependencies
    ```
    brew install ripgrep fasd tmux direnv gpg envchain
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
1. Install tpm plugins by running tmux then pressing `Ctrl + a, i`

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
# add Microsoft repo with .Net 3.1 runtime
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# add repo with genie
curl -s https://packagecloud.io/install/repositories/arkane-systems/wsl-translinux/script.deb.sh | sudo bash

sudo apt update
sudo apt install systemd-genie
```

### `/usr/lib/genie/deviated-preverts.conf`

```
{
  "daemonize": "/usr/bin/daemonize",
  "mount": "/bin/mount",
  "runuser": "/sbin/runuser",
  "systemd": "/bin/systemd"
}
```

Use `wsl genie -s` in your terminal emulator

Instructions taken from https://kumekay.com/wsl2-and-systemd/

## Secrets

```
ln -s .secrets/ssh .ssh
gpg --import ~/.secrets/gpg/secret.asc
gpg --import-ownertrust ~/.secrets/gpg/ownerturst.txt

# MacOS
envchain --set github GITHUB_TOKEN
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
