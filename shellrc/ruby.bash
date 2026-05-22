# --------------------------------------------------------------------------------------------------
# Ruby
# --------------------------------------------------------------------------------------------------

# Heroku toolbelt #
if [[ -d $HOMEBREW_PREFIX/heroku/bin ]]; then
  export PATH="$HOMEBREW_PREFIX/heroku/bin:$PATH"
fi
# echo "After heroku: " $PATH

# ASDF & Rbenv #
# Only initialize it for interactive shells
if [[ -z "$PS1" ]]; then
  for _openssl_ver in openssl@4 openssl@3 openssl@1.1; do
    if [[ -d ${HOMEBREW_PREFIX}/opt/$_openssl_ver ]]; then
      export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/$_openssl_ver"
      break
    fi
  done
  unset _openssl_ver

  if [[ -d $HOME/.rbenv ]]; then
    eval "$(rbenv init -)"
  fi
fi
# echo "After rbenv init: " $PATH

# RVM #
if [[ -d $HOME/.rvm ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
# echo "After rvm init: " $PATH
