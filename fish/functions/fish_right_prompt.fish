function fish_right_prompt
	
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	switch $USER

		case root

		echo -n -s \
      (set_color red) "$USER" @ "$__fish_prompt_hostname" " " \
      (prompt_pwd) \
      "$__fish_prompt_normal"

		case '*'

		echo -n -s \
      (set_color 1E90FF) "$USER" @ "$__fish_prompt_hostname" " " \
      (set_color 0CFFA9) (prompt_pwd) \
      "$__fish_prompt_normal"

	end

end
