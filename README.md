## Install
```bash
git clone https://github.com/marksteve/dotfiles
cd dotfiles
./install.sh
git submodule update --init
```

## Update submodules
```
./update.sh
```

## Python tools

### OSX

```
sudo easy_install pip
pip install --user virtualenv isort
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
pipsi install frosted
pipsi install pep8
pipsi install ipython[notebook]
```
