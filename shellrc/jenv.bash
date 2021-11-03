# --------------------------------------------------------------------------------------------------
# Java environment
# --------------------------------------------------------------------------------------------------

if [[ -x $HOMEBREW_PREFIX/bin/jenv ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi
# echo "After jenv init: " $PATH
