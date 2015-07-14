function fish_prompt --description 'Write out the prompt'

  # virtualfish
  if set -q VIRTUAL_ENV
    echo -n -s (set_color 867FFE) (basename "$VIRTUAL_ENV") " "
  end

  # git branch
  echo -n -s (set_color FFC60C) \
    (git symbolic-ref HEAD | sed 's/refs\/heads\///' 2>/dev/null) \

  # Should be git status
  echo " ⚡" (set_color normal)

end
