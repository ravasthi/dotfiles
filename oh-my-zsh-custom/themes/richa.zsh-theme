grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$cyan%}) %{%F{yellow}%}✗%{%f%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%})"

function richa_left_prompt {
  prompt="
[%{%F{yellow}%}%T%{%f%}] %{%F{magenta}%}%n%{%f%} at %{%F{magenta}%}%m%{%f%} in %{%F{blue}%}%4(~:…:)%3~%{%f%}
%(?,%{%F{green}%},%{%F{red}%})✽%{%f%} "

  echo $prompt
}

function richa_right_prompt {
  branch=$(current_branch)
  ruby_version=$(rvm_prompt_info || rbenv_prompt_info)

  prompt="%{%F{red}%}$(rvm_prompt_info || rbenv_prompt_info)%{%f%} $(git_prompt_info)"

  echo $prompt
}

setopt prompt_subst

PROMPT='$(richa_left_prompt)'

RPROMPT='$(richa_right_prompt)'
