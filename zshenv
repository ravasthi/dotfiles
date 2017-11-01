export LANG=en_US.UTF-8

# Set default paths explicitly, since it doesn't seem to be happening.
if [[ -x /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
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

if [[ -d /Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home
  export JAVA_ROOT=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents
  export MAVEN_OPTS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError"
fi

# --------------------------------------------------------------------------------------------------
# MySQL
# --------------------------------------------------------------------------------------------------

if [[ -d /usr/local/mysql/bin ]]; then
  export PATH=/usr/local/mysql/bin:$PATH
fi

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

# --------------------------------------------------------------------------------------------------
# Python
# --------------------------------------------------------------------------------------------------

if [[ -d ~/.virtualenvs ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
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

  [[ -x /usr/local/bin/pyenv-virtualenv ]] && eval "$(pyenv virtualenv-init -)"
  pyenv virtualenvwrapper
fi

# --------------------------------------------------------------------------------------------------
# Ruby
# --------------------------------------------------------------------------------------------------

# Heroku toolbelt #
if [[ -d /usr/local/heroku/bin ]]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# Rbenv #
if [[ -d $HOME/.rbenv ]]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# RVM #
if [[ -d $HOME/.rvm ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# --------------------------------------------------------------------------------------------------
# Custom scripts
# --------------------------------------------------------------------------------------------------

if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH
fi

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

