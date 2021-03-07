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
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

function node_version {
  if [[ -d $HOME/.nvm ]]; then
    node_version=`nvm current | sed 's/v\(.*\)/\1/'`
  else
    if [[ -x /usr/local/bin/nodenv ]]; then
      node_version=`nodenv version | sed -E 's/(^([[:digit:]]+\.?)+)( .*)$/\1/'`
    fi
  fi

  echo $node_version
}

function richa_left_prompt {
  # Only show host if not on local machine
  userhost="%{$fg[magenta]%}%n%{$reset_color%}"

  if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    userhost="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[magenta]%}%m%{$reset_color%}"
  fi

  node_prompt_info="%{$fg[cyan]%}(node-$(node_version))%{$reset_color%}"

  if [[ -o interactive ]]; then
    ruby_prompt_info=$(rvm_prompt_info || rbenv_prompt_info)
  else
    ruby_prompt_info=""
  fi

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
