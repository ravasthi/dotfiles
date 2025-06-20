# --------------------------------------------------------------------------------------------------
# ASDF: package manager for multiple languages
# https://asdf-vm.com/
# --------------------------------------------------------------------------------------------------

if [[ $(typeset -f asdf >/dev/null 2>&1) ]]; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

  # Add plugins if they don't exist
  if ! [[ -d $HOME/.asdf/plugins ]]; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  fi
fi
