# dotfiles
> That's the Way (I Like It)

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

### Ubuntu

1. Install dependencies
    ```
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    sh -c "$(curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh)"
    sudo apt install zsh ripgrep tmux direnv syncthing pinentry-gtk2 gocryptfs keychain
    ```

### MacOS

1. Install brew and port
1. Install dependencies
    ```
    eval $(/opt/homebrew/bin/brew shellenv)
    brew bundle install
    sudo port install gocryptfs
    sudo ln -fsn /opt/local/Library/Filesystems/macfuse.fs /Library/Filesystems/macfuse.fs
    ```

Store SSH private key passphrase in keychain:

```
ssh-add -K
```

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

## Python

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Node

```
curl https://mise.run | sh
mise install
```
