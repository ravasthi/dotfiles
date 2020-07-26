# --------------------------------------------------------------------------------------------------
# iTerm shell integration
# --------------------------------------------------------------------------------------------------
if [[ "$TERM_PROGRAM" == "iTerm.app" ]] && [[ -s $HOME/.iterm2_shell_integration.zsh ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi
