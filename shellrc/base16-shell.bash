# --------------------------------------------------------------------------------------------------
# Base16 shell
# --------------------------------------------------------------------------------------------------

# Base16 Shell
BASE16_SHELL_PATH="$HOME/.config/base16-shell"
if [[ -n "$PS1" ]] && [[ -s "$BASE16_SHELL_PATH/profile_helper.sh" ]];then
  source "$BASE16_SHELL_PATH/profile_helper.sh"
fi
