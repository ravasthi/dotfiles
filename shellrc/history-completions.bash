# --------------------------------------------------------------------------------------------------
# History and completions
# --------------------------------------------------------------------------------------------------

export HISTIGNORE="&:ls:l:la:ll:ls -al:exit"
export HISTCONTROL=erasedups
shopt -s histappend
if [[ $- == *i* ]]; then
  bind '"\e[A"':history-search-backward # up arrow
  bind '"\e[B"':history-search-forward  # down arrow
fi

# Note that bash_completion is necessary for __git_ps1 magic
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
