###########
# Aliases #

alias b='bundle exec'
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias get='git'
alias ls='ls -hFG'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias removeallgems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias vi='vim'

# Use Apple's man page viewer if we are on a local console
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
  function man {
    open x-man-page://$1
  }
fi

########
# Tmux #

function tmuxcolors {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

############
# Homebrew #

export PATH=/usr/local/bin:$PATH

export LANG=en_US.UTF-8

# Shortcut for `bundle exec rails` and `bundle exec rake`.
# If script/rails and script/rake are available, use them instead as they are much
# faster to execute than `bundle exec`.
function r() {
  if [[ "g|generate|c|console|s|server|db|dbconsole|new" =~ $1 ]]; then
    if [[ -x script/rails ]]; then
      script/rails $@
    else
      bundle exec rails $@
    fi
  else
    if [[ -x script/rake ]]; then
      script/rake $@
    else
      bundle exec rake $@
    fi
  fi
}

#####################
# Python virtualenv #

export PATH=/usr/local/share/python:$PATH

if [[ -d ~/.virtualenvs ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export VIRTUALENV_USE_DISTRIBUTE=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
  [[ -f /usr/local/share/python/virtualenvwrapper.sh ]] && . /usr/local/share/python/virtualenvwrapper.sh
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
