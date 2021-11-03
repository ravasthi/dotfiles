# --------------------------------------------------------------------------------------------------
# Homebrew
# --------------------------------------------------------------------------------------------------

if [[ -d /opt/homebrew/bin ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew";
elif [[ -d /usr/local/bin ]]; then
  export HOMEBREW_PREFIX="/usr/local";
fi

export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX";
export HOMEBREW_SHELLENV_PREFIX="$HOMEBREW_PREFIX";
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}";
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}";


# echo "After homebrew: " $PATH
