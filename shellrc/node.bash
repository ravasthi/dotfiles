# --------------------------------------------------------------------------------------------------
# Node
# --------------------------------------------------------------------------------------------------

# NVM #
# Only do this if asdf is not installed
if ! brew ls --versions asdf > /dev/null; then
  if ! [[ -d $HOME/.nvm ]]; then
    echo "Creating $HOME/.nvm…"
    mkdir -p $HOME/.nvm
  fi

  export NVM_DIR="$HOME/.nvm"

  if [[ -s $NVM_DIR/nvm.sh ]]; then
    source $NVM_DIR/.nvm/nvm.sh
  elif [[ -s $HOMEBREW_PREFIX/opt/nvm/nvm.sh ]]; then
    source $HOMEBREW_PREFIX/opt/nvm/nvm.sh
  fi
fi

# NPM #
if [[ -d $HOME/node_modules ]]; then
  export PATH=$HOME/node_modules/.bin:$PATH
fi
# echo "After updating for nvm/npm: " $PATH

# nodenv #
if [[ -x $HOMEBREW_PREFIX/bin/nodenv ]]; then
  eval "$(nodenv init -)"
fi

# AVN #
# if [[ -s "$HOME/.avn/bin/avn.sh" ]]; then
#   source "$HOME/.avn/bin/avn.sh"
# fi
