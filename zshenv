export LANG=en_US.UTF-8

# Set default paths explicitly, since it doesn't seem to be happening.
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

##############
# Git prompt #

if [[ -f `readlink ~/.zsh-git-prompt`/zshrc.sh ]]; then
  source `readlink ~/.zsh-git-prompt`/zshrc.sh
fi

############
# Homebrew #

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#####################
# Python virtualenv #

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

########################
# Subversion/Mercurial #

if [[ -x ~/.bin/edit ]]; then
  export SVN_EDITOR=~/.bin/edit
  export HGEDITOR=~/.bin/edit
fi
if [[ -f ~/.svn_color ]]; then
  source ~/.svn_color
fi

####################
# Java Environment #

if [[ -d /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
  export JAVA_ROOT=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents
  export MAVEN_OPTS="-Xmx512m -XX:+HeapDumpOnOutOfMemoryError"
fi

#########
# MySQL #

if [[ -d /usr/local/mysql/bin ]]; then
  export PATH=/usr/local/mysql/bin:$PATH
fi

########
# Node #

# NVM #
if [[ -x $HOME/.nvm ]]; then
  source $HOME/.nvm/nvm.sh
fi

# NPM #
if [[ -r $HOME/node_modules ]]; then
  export PATH=$HOME/node_modules/.bin:$PATH
fi


########
# Pear #
if [[ -x $HOME/pear/bin/pear ]]; then
  export PATH=$HOME/pear/bin:$PATH
fi

########
# Ruby #

# Heroku Toolbelt #
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

##################
# Custom Scripts #

if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH
fi

