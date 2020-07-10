# OS X has its own way of setting LANG, but only at the console.
# By declaring here in .bashrc, daemons like Pow will also pick it up.
export LANG=en_US.UTF-8

# Set default paths explicitly, since it doesn't seem to be happening.
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# --------------------------------------------------------------------------------------------------
# vi key bindings
# --------------------------------------------------------------------------------------------------

set -o vi

# --------------------------------------------------------------------------------------------------
# Homebrew
# --------------------------------------------------------------------------------------------------

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# --------------------------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------------------------

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

# --------------------------------------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------------------------------------

if [[ -f ~/.functions ]]; then
  source ~/.functions
fi

# --------------------------------------------------------------------------------------------------
# History and completions
# --------------------------------------------------------------------------------------------------

export HISTIGNORE="&:ls:l:la:ll:ls -al:exit"
export HISTCONTROL=erasedups
shopt -s histappend
if [[ $- == *i* ]]; then
  bind '"\e[A"':history-search-backward # up arrow
  bind '"\e[B"':history-search-forward  # down arrow
fi

# Note that bash_completion is necessary for __git_ps1 magic
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# --------------------------------------------------------------------------------------------------
# iTerm shell integration
# --------------------------------------------------------------------------------------------------

if [[ "$TERM_PROGRAM" == "iTerm.app" ]] && [[ -s $HOME/.iterm2_shell_integration.bash ]]; then
  source "$HOME/.iterm2_shell_integration.bash"
fi

# --------------------------------------------------------------------------------------------------
# PS1
# --------------------------------------------------------------------------------------------------

export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
# Only show last 2 directories that make up the current path
export PROMPT_DIRTRIM=2

# Omit the hostname from PS1 if we are on the local console
userhost="\u"
if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
  userhost="@`hostname -s`"
fi

export PS1='\[\e[0;30;43m\]$userhost \[\e[0m\]\[\e[1m\]\w$ \[\e[0m\]'

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
# Git
# --------------------------------------------------------------------------------------------------

if [[ -f `readlink ~/.bash-git-prompt/gitprompt.sh` ]]; then
  export GIT_PROMPT_THEME=Custom
  source `readlink ~/.bash-git-prompt/gitprompt.sh`
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
# Java environment
# --------------------------------------------------------------------------------------------------

if [[ -x /usr/local/bin/jenv ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
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

if [[ -r $NVM_DIR/bash_completion ]]; then
  source $NVM_DIR/bash_completion
fi

# NPM #
if [[ -r $HOME/node_modules ]]; then
  export PATH=$HOME/node_modules/.bin:$PATH
fi

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

# --------------------------------------------------------------------------------------------------
# Python
# --------------------------------------------------------------------------------------------------

if [[ -d /usr/local/opt/python/libexec/bin ]]; then
  export PATH=/usr/local/opt/python/libexec/bin:$PATH
fi

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
fi

if [[ -x /usr/local/bin/pyenv-virtualenv ]]; then
  eval "$(pyenv virtualenv-init -)"
fi

if [[ -x /usr/local/bin/pyenv-virtualenvwrapper ]]; then
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  pyenv virtualenvwrapper_lazy
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
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  eval "$(rbenv init -)"
fi

# RVM #
if [[ -d $HOME/.rvm ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH=$HOME/.rvm/bin:$PATH
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

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
# Custom scripts
# --------------------------------------------------------------------------------------------------

if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH
fi

# use .localrc for settings specific to one system
if [[ -f $HOME/.localrc ]]; then
  source $HOME/.localrc
fi
