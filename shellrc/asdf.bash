# --------------------------------------------------------------------------------------------------
# ASDF: package manager for multiple languages
# https://asdf-vm.com/
# --------------------------------------------------------------------------------------------------

if [[ -s $(brew --prefix asdf)/libexec/asdf.sh ]]; then
  source $(brew --prefix asdf)/libexec/asdf.sh

  # Add plugins if they don't exist
  if ! [[ -d $HOME/.asdf/plugins ]]; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  fi
fi
