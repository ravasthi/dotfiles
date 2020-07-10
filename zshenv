export LANG=en_US.UTF-8

# Set default paths explicitly, since it doesn't seem to be happening.
if [[ -x /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi
# echo "After running path_helper: " $PATH

# --------------------------------------------------------------------------------------------------
# Autojump
# --------------------------------------------------------------------------------------------------

if [[ -f /usr/local/etc/profile.d/autojump.sh ]]; then
  source /usr/local/etc/profile.d/autojump.sh
fi

# --------------------------------------------------------------------------------------------------
# Editor
# --------------------------------------------------------------------------------------------------

if [[ -x /usr/local/bin/vim ]]; then
  export EDITOR=/usr/local/bin/vim
fi

# --------------------------------------------------------------------------------------------------
# Git prompt
# --------------------------------------------------------------------------------------------------

if [[ -f `readlink ~/.zsh-git-prompt/zshrc.sh` ]]; then
  source `readlink ~/.zsh-git-prompt/zshrc.sh`
fi

# --------------------------------------------------------------------------------------------------
# Go
# --------------------------------------------------------------------------------------------------

if [[ -x /usr/local/bin/go ]]; then
  mkdir -p $HOME/.go
  export GOPATH=$HOME/.go

  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# --------------------------------------------------------------------------------------------------
# Groovy
# --------------------------------------------------------------------------------------------------

if [[ -d /usr/local/opt/groovy/libexec ]]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi

# --------------------------------------------------------------------------------------------------
# Homebrew
# --------------------------------------------------------------------------------------------------

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# echo "After homebrew: " $PATH

# --------------------------------------------------------------------------------------------------
# Subversion/Mercurial
# --------------------------------------------------------------------------------------------------

if [[ -x ~/.bin/edit ]]; then
  export SVN_EDITOR=~/.bin/edit
  export HGEDITOR=~/.bin/edit
fi
if [[ -f ~/.svn_color ]]; then
  source ~/.svn_color
fi

# --------------------------------------------------------------------------------------------------
# Java environment
# --------------------------------------------------------------------------------------------------

if [[ -x /usr/local/bin/jenv ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi
# echo "After jenv init: " $PATH

# --------------------------------------------------------------------------------------------------
# MySQL
# --------------------------------------------------------------------------------------------------

if [[ -d /usr/local/mysql/bin ]]; then
  export PATH=/usr/local/mysql/bin:$PATH
fi
# echo "After updating for mysql: " $PATH

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

# --------------------------------------------------------------------------------------------------
# Pear
# --------------------------------------------------------------------------------------------------

if [[ -x $HOME/pear/bin/pear ]]; then
  export PATH=$HOME/pear/bin:$PATH
fi
# echo "After pear: " $PATH

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

# --------------------------------------------------------------------------------------------------
# Ruby
# --------------------------------------------------------------------------------------------------

# Heroku toolbelt #
if [[ -d /usr/local/heroku/bin ]]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi
# echo "After heroku: " $PATH

# Rbenv #
if [[ -d $HOME/.rbenv ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  eval "$(rbenv init -)"
fi

# RVM #
if [[ -d $HOME/.rvm ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
# echo "After rvm: " $PATH

# --------------------------------------------------------------------------------------------------
# Custom scripts
# --------------------------------------------------------------------------------------------------

if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH
fi
# echo "After adding ~/.bin: " $PATH

# --------------------------------------------------------------------------------------------------
# Misc
# --------------------------------------------------------------------------------------------------

# Yeoman completion #
_yo_completion () {
  local cword line point words si
  read -Ac words
  read -cn cword
  let cword-=1
  read -l line
  read -ln point
  si="$IFS"
  IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                     COMP_LINE="$line" \
                     COMP_POINT="$point" \
                     yo-complete completion -- "${words[@]}" \
                     2>/dev/null)) || return $?
  IFS="$si"
}
compctl -K _yo_completion yo

