# --------------------------------------------------------------------------------------------------
# Python
# --------------------------------------------------------------------------------------------------

if [[ -d $HOMEBREW_PREFIX/opt/python/libexec/bin ]]; then
  export PATH=$HOMEBREW_PREFIX/opt/python/libexec/bin:$PATH
fi
if [[ -d ~/.local/bin ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi
# echo "After python setting: " $PATH

if [[ -d ~/.virtualenvs ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export VIRTUALENVWRAPPER_PYTHON=$HOMEBREW_PREFIX/opt/python/libexec/bin/python
  export VIRTUALENV_USE_DISTRIBUTE=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
  [[ -f $HOMEBREW_PREFIX/bin/virtualenvwrapper.sh ]] && . $HOMEBREW_PREFIX/bin/virtualenvwrapper.sh
fi

if [[ -x $HOMEBREW_PREFIX/opt/autoenv/activate.sh ]]; then
  source $HOMEBREW_PREFIX/opt/autoenv/activate.sh
fi

if [[ -x $HOMEBREW_PREFIX/bin/pyenv ]]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"

  if [[ -x $HOMEBREW_PREFIX/bin/pyenv-virtualenv ]]; then
    eval "$(pyenv virtualenv-init -)"
  fi

  if [[ -x $HOMEBREW_PREFIX/bin/pyenv-virtualenvwrapper ]]; then
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
    pyenv virtualenvwrapper_lazy
  fi
fi
# echo "After pyenv: " $PATH
