# --------------------------------------------------------------------------------------------------
# PS1
# --------------------------------------------------------------------------------------------------

export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
# Only show last 2 directories that make up the current path
export PROMPT_DIRTRIM=2

# Omit the hostname from PS1 if we are on the local console
userhost="\u"
bold="\[\e[1m\]"
normal="\[\e[0m\]"
blue="\[\e[34m\]"
purple="\[\e[35m\]"
if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
  userhost="@`hostname -s`"
fi

export PS1="$bold[$purple$userhost$normal $blue\w$normal$bold]$ $normal"
