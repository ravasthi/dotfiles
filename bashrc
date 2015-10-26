# OS X has its own way of setting LANG, but only at the console.
# By declaring here in .bashrc, daemons like Pow will also pick it up.
export LANG=en_US.UTF-8

# Set default paths explicitly, since it doesn't seem to be happening.
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

############
# Homebrew #

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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

###########################
# History and Completions #

export HISTIGNORE="&:ls:l:la:ll:ls -al:exit"
export HISTCONTROL=erasedups
shopt -s histappend
if [[ $- == *i* ]]; then
  bind '"\e[A"':history-search-backward # up arrow
  bind '"\e[B"':history-search-forward  # down arrow
fi

# Note that bash_completion is necessary for __git_ps1 magic
if [[ -f `brew --prefix`/etc/bash_completion ]]; then
  . `brew --prefix`/etc/bash_completion
fi

#######
# PS1 #

export LSCOLORS=Dxxxxxxxxxxxxxxxxxxxxx
# Only show last 2 directories that make up the current path
export PROMPT_DIRTRIM=2

# Omit the hostname from PS1 if we are on the local console
userhost=""
if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
  userhost=" `hostname -s` "
fi

export PS1='\[\e[0;30;43m\]$userhost\[\e[0m\]\[\e[1m\]\w$ \[\e[0m\]'

#######
# Git #

# Include git goodies in PS1 if possible
if [[ "`type -t __git_ps1`" == 'function' ]]; then
  export GIT_PS1_SHOWDIRTYSTATE=true     # '*' for unstaged changes, '+' for staged
  export GIT_PS1_SHOWSTASHSTATE=true     # '$' if smth is stashed
  export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files

  export PS1='[\[\e[0;33m\]\A\[\e[0m\]] \[\e[0;35m\]\u@\h: \[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;37m\]$(__git_ps1 " (%s)")\[\e[0m\]\[\e[1m\]$ \[\e[0m\]'
else
  export PS1='[\[\e[0;33m\]\A\[\e[0m\]] \[\e[0;35m\]\u@\h: \[\e[0m\]\[\e[1;34m\]\w$ \[\e[0m\]'
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

#################
# Oracle Client #

# Assume Oracle Instant Client is installed in /opt/custom/oracle
# if [[ -d /opt/custom/oracle ]]; then
#   export ORACLE_CLIENT_HOME=/opt/custom/oracle
#   export PATH=$ORACLE_CLIENT_HOME:$PATH
#   export DYLD_LIBRARY_PATH=$ORACLE_CLIENT_HOME
#   export NLS_LANG=AMERICAN_AMERICA.UTF8
#   export TWO_TASK=DEVDB
#   export SQLPATH=${ORACLE_CLIENT_HOME}
#
#   # User scripts can be placed in ~/Library/Oracle/
#   if [[ -d ${HOME}/Library/Oracle/ ]]; then
#     export SQLPATH=${SQLPATH}:${HOME}/Library/Oracle/Scripts
#     export TNS_ADMIN=${HOME}/Library/Oracle/Admin
#   fi
# fi

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

if [[ -r $NVM_DIR/bash_completion ]]; then
  source $NVM_DIR/bash_completion
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

# use .localrc for settings specific to one system
if [[ -f $HOME/.localrc ]]; then
  source $HOME/.localrc
fi
