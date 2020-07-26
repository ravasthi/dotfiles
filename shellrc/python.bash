# --------------------------------------------------------------------------------------------------
# Python
# --------------------------------------------------------------------------------------------------

if [[ -d /usr/local/opt/python/libexec/bin ]]; then
  export PATH=/usr/local/opt/python/libexec/bin:$PATH
fi
# echo "After python setting: " $PATH

if [[ -d ~/.virtualenvs ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export VIRTUALENV_USE_DISTRIBUTE=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
  [[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh
fi

if [[ -x /usr/local/opt/autoenv/activate.sh ]]; then
  source /usr/local/opt/autoenv/activate.sh
fi

if [[ -x /usr/local/bin/pyenv ]]; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"

  if [[ -x /usr/local/bin/pyenv-virtualenv ]]; then
    eval "$(pyenv virtualenv-init -)"
  fi

  if [[ -x /usr/local/bin/pyenv-virtualenvwrapper ]]; then
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
    pyenv virtualenvwrapper_lazy
  fi
fi
# echo "After pyenv: " $PATH
