# --------------------------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------------------------

# -----[ General aliases ]------------------------------------------------------
alias b='bundle exec '
# Change to the root level directory the current git repository
alias cdg='cd $(git rev-parse --show-toplevel || pwd)'
alias diff='colordiff'
alias flushdns='dscacheutil -flushcache'
alias get='git'
alias ls='ls -hFG'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias marksafe='xattr -rd com.apple.quarantine "$@"'
alias mmdate='date "+%Y-%m-%d %H:%M %z"'
alias resetdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias resetopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias removeallgems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias showzshprocs="ps -ef | grep 'zsh -c' | grep -v grep"
alias killzshprocs="showzshprocs | ruby -e 'STDIN.read.split(%q[\n]).each { |line| puts line.split[1] }' | xargs kill -9; showzshprocs"
alias top='top -s 5 -o cpu -stats pid,user,command,cpu,rsize,vsize,threads,state'
alias vi='vim'

# -----[ Other development aliases ]--------------------------------------------
# ----------[ Git ]-------------------------------------------------------------
alias ga='git add '
alias gap='git add -p '
alias gb='git branch '
alias gci='git commit'
alias gcii='git commit --template=$HOME/.gitmessage_issue'
alias gciwip='git commit --template=$HOME/.gitmessage_wip'
alias gciiwip='git commit --template=$HOME/.gitmessage_issue_wip'
alias gco='git checkout '
alias gcp='git cherry-pick '
alias gd='git diff '
alias gf='git fetch '
alias ghs='git hist'
alias ghb='hub browse '
alias gk='gitk --all&'
alias gpl='git pull '
alias gps='git push '
alias grb='git rebase '
alias gsl='git stash list'
alias gsa='git stash apply '
alias gsp='git stash pop '
alias gss='showStashFilesAt '
alias gssp='showStashPatchAt '
alias gst='git status -s -b '
alias gsv='git stash save '
alias gsvp='git stash save -p '
alias gsvpu='git stash save -p -u '
alias gt='cd $(git rev-parse --show-toplevel)'
alias gx='gitx --all'

# Temporarily update the index to ignore all files in the current directory
alias gau='git ls-files | tr "\n" " " | xargs git update-index --assume-unchanged'
# Revert the index to its original state
alias gnau='git ls-files | tr "\n" " " | xargs git update-index --no-assume-unchanged'

# Pull all subdirectories one level below the working directory
alias gpall='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;'

# ----------[ Django ]----------------------------------------------------------
alias dj='./manage.py '
alias djs='./manage.py runserver '
alias djsdb='./manage.py syncdb'
alias djm='./manage.py migrate'
alias djsh='./manage.py shell'
alias djdbsh='./manage.py dbshell'

# ----------[ grep ]------------------------------------------------------------
alias grep='grep --color=always'
alias grepnc='grep --color=never'

# ----------[ asdf ]------------------------------------------------------------
alias ain='asdf install'
alias ainru='asdf install ruby'
alias ainno='asdf install nodejs'
alias aun='asdf uninstall'
alias aunru='asdf uninstall ruby'
alias aunno='asdf uninstall nodejs'
alias als='asdf list'
alias alsa='asdf list all'
alias apu='asdf plugin update'

# ----------[ Node ]------------------------------------------------------------
alias backup-npmrc='mv ~/.npmrc ~/.npmrc.bak'
latestnodeversionregex='[ ]+v[18]+[0-6]?'
alias nenvlistlatestversions='nodenv install -l | ag "$latestnodeversionregex"'
alias nexm='node --experimental-modules --es-module-specifier-resolution=node -r esm'
alias nr='npm run'
alias ntl='npm ls --depth=0'
alias nvmlsr='nvm ls-remote | ag "$latestnodeversionregex"'
alias nvmu='nvm uninstall'
alias restore-npmrc='mv ~/.npmrc.bak ~/.npmrc'
alias yr='yarn run'
