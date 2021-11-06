# --------------------------------------------------------------------------------------------------
# nvm bash completion
# --------------------------------------------------------------------------------------------------

if [[ -s $HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm ]]; then
  source $HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm
fi

if [[ -s $NVM_DIR/bash_completion ]]; then
  source $NVM_DIR/bash_completion
fi
