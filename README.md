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

## Install

```sh
git clone https://github.com/marksteve/dotfiles
cd dotfiles
./install.sh
```

## Python

```
pip3 install --user pipx
cat requirements.in | xargs -I '{}' pipx install {}
```

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

