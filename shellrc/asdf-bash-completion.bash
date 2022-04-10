# --------------------------------------------------------------------------------------------------
# ASDF Bash completions
# --------------------------------------------------------------------------------------------------

if [[ -s $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash ]]; then
  source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
fi
