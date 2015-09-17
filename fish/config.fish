# Virtualfish
eval (python -m virtualfish)

function tarsnap-backup
  tarsnap -v --humanize-numbers -c -f (realpath "$1")(date -u +%s) $1
end

# Autoload config
for f in $HOME/.config/fish/config.d/*.fish; . $f; end
