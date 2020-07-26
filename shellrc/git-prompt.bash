# --------------------------------------------------------------------------------------------------
# Git prompt
# --------------------------------------------------------------------------------------------------

if [[ -f `readlink ~/.bash-git-prompt/gitprompt.sh` ]]; then
  export GIT_PROMPT_THEME=Custom
  source `readlink ~/.bash-git-prompt/gitprompt.sh`
fi
