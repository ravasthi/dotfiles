# --------------------------------------------------------------------------------------------------
# iTerm shell integration
# --------------------------------------------------------------------------------------------------
if [[ "$TERM_PROGRAM" == "iTerm.app" ]] && [[ -s $HOME/.iterm2_shell_integration.bash ]]; then
  source "$HOME/.iterm2_shell_integration.bash"
fi
