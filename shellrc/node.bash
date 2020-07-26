# --------------------------------------------------------------------------------------------------
# Node
# --------------------------------------------------------------------------------------------------

# NVM #
if [[ -d $HOME/.nvm ]]; then
  source $HOME/.nvm/nvm.sh
fi

# NPM #
if [[ -r $HOME/node_modules ]]; then
  export PATH=$HOME/node_modules/.bin:$PATH
fi
# echo "After updating for nvm/npm: " $PATH

# nodenv #
if [[ -x /usr/local/bin/nodenv ]]; then
  eval "$(nodenv init -)"
fi

# AVN #
# if [[ -s "$HOME/.avn/bin/avn.sh" ]]; then
#   source "$HOME/.avn/bin/avn.sh"
# fi
