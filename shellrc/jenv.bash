# --------------------------------------------------------------------------------------------------
# Java environment
# --------------------------------------------------------------------------------------------------

if [[ -x $HOMEBREW_PREFIX/bin/jenv ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  if [[ -o interactive ]]; then
    eval "$(jenv init -)"
  fi
fi
# echo "After jenv init: " $PATH
