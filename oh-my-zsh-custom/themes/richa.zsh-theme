grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_SEPARATOR=" |"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[blue]%}%{✚%G%} "
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%} "
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[yellow]%}%{●%G%} "
ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%} "
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[magenta]%}%{…%G%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%} "

# For vi mode
MODE_INDICATOR="%{$fg[green]%}[normal]%{$reset_color%}"


function richa_left_prompt {
  prompt="
[%{$fg[yellow]%}%T%{$reset_color%}] %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[magenta]%}%m%{$reset_color%} in %{$fg[blue]%}%4(~:…:)%3~%{$reset_color%} $(vi_mode_prompt_info)
%(?,%{$fg[green]%},%{$fg[red]%})✽%{$reset_color%} "

  echo $prompt
}

function richa_right_prompt {
  branch=$(current_branch)
  ruby_version=$(rvm_prompt_info || rbenv_prompt_info)

  prompt="%{$fg[red]%}$(rvm_prompt_info || rbenv_prompt_info)%{$reset_color%} $(git_super_status)"

  echo $prompt
}

setopt prompt_subst

PROMPT='$(richa_left_prompt)'

RPROMPT='$(richa_right_prompt)'
