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
  # Only show host if not on local machine
  userhost="%{$fg[magenta]%}%n%{$reset_color%}"

  if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    userhost="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[magenta]%}%m%{$reset_color%}"
  fi

  ruby_prompt_info=$(rvm_prompt_info || rbenv_prompt_info)

  node_version=`nvm current | sed 's/v\(.*\)/\1/'`
  node_prompt_info="%{$fg[cyan]%}(node-${node_version})%{$reset_color%}"

  prompt="
$userhost in %{$fg[blue]%}%4(~:…:)%3~%{$reset_color%} %{$fg[red]%}$ruby_prompt_info%{$reset_color%} ${node_prompt_info} $(vi_mode_prompt_info)
[%{$fg[yellow]%}%T%{$reset_color%}]%(?,%{$fg[green]%},%{$fg[red]%})✽%{$reset_color%} "

  echo $prompt
}

function richa_right_prompt {
  prompt="$(git_super_status)"

  echo $prompt
}

setopt prompt_subst

PROMPT='$(richa_left_prompt)'

RPROMPT='$(richa_right_prompt)'
