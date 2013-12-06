export LANG=en_US.UTF-8

############
# Homebrew #

export PATH=/usr/local/bin:$PATH

###########
# Aliases #

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

#############
# Functions #

if [[ -f ~/.functions ]]; then
  source ~/.functions
fi

#####################
# Python virtualenv #

if [[ -d ~/.virtualenvs ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export VIRTUALENV_USE_DISTRIBUTE=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
  [[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh
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

if [[ -d /System/Library/Frameworks/JavaVM.framework/Versions/1.6 ]]; then
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
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

##################
# Custom Scripts #

if [[ -d $HOME/.bin ]]; then
  export PATH=$HOME/.bin:$PATH
fi

########
# Ruby #

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

# Heroku Toolbelt #
if [[ -d /usr/local/heroku/bin ]]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

