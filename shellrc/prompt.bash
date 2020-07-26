# --------------------------------------------------------------------------------------------------
# PS1
# --------------------------------------------------------------------------------------------------

export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
# Only show last 2 directories that make up the current path
export PROMPT_DIRTRIM=2

# Omit the hostname from PS1 if we are on the local console
userhost="\u"
if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
  userhost="@`hostname -s`"
fi

export PS1='\[\e[0;30;43m\]$userhost \[\e[0m\]\[\e[1m\]\w$ \[\e[0m\]'
