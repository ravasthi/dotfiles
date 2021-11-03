# --------------------------------------------------------------------------------------------------
# Ruby
# --------------------------------------------------------------------------------------------------

# Heroku toolbelt #
if [[ -d $HOMEBREW_PREFIX/heroku/bin ]]; then
  export PATH="$HOMEBREW_PREFIX/heroku/bin:$PATH"
fi
# echo "After heroku: " $PATH

# Rbenv #
# Only initialize it for interactive shells
if [[ -z "$PS1" && -d $HOME/.rbenv ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  eval "$(rbenv init -)"
fi
# echo "After rbenv init: " $PATH

# RVM #
if [[ -d $HOME/.rvm ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
# echo "After rvm init: " $PATH
