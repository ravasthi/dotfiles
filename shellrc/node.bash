# --------------------------------------------------------------------------------------------------
# Node
# --------------------------------------------------------------------------------------------------

# NVM #
if ! [[ -d $HOME/.nvm ]]; then
  echo "Creating $HOME/.nvm…"
  mkdir -p $HOME/.nvm
fi

export NVM_DIR="$HOME/.nvm"

if [[ -s $HOME/.nvm/nvm.sh ]]; then
  source $HOME/.nvm/nvm.sh
elif [[ -s $HOMEBREW_PREFIX/opt/nvm/nvm.sh ]]; then
  source $HOMEBREW_PREFIX/opt/nvm/nvm.sh
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
