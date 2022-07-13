# --------------------------------------------------------------------------------------------------
# Common functions
# --------------------------------------------------------------------------------------------------

# ------------------------------------------------
# System
# ------------------------------------------------
# Copy contents of a file to a clipboard
function cb {
  if [[ -e "$@" ]]; then
    cat "$@" | pbcopy
  else
    echo $@ "not found."
  fi
}

# Print the contents of a directory after changing into it.
function cdls { cd "$@"; ls -p; }

# Use Apple's man page viewer if we are on a local console
if [[ "$TERM_PROGRAM" == "Apple_Terminal" || "$TERM_PROGRAM" == "iTerm.app" ]]; then
  function man {
    open x-man-page://$1
  }
fi

# Mark a file as safe so OS X doesn't ask for confirmation when opening
function marksafe {
  echo "Marking items in" $@ "safe."
  xattr -rd com.apple.quarantine "$@"
}

# Measure the elapsed time of the desired command in milliseconds.
function measuredurationof {
  bold=$(tput bold)
  normal=$(tput sgr0)
  ts=$(gdate +%s%N)

  $@

  tt=$((($(gdate +%s%N) - $ts)/1000000))
  printf "\n--------------------------------------------------\n"
  printf "Elapsed time: ${bold}$tt${normal} ms"
  printf "\n--------------------------------------------------\n"
}

function mute {
  osascript -e 'set volume 0'
}

# Show any running processes matching input
function proc {
  ps -ef | grep "$1" | grep -v grep
}

function setbasedir {
  if [[ -z "$1" ]]; then
    WD=$(setbasedirhelper);
  else
    WD=$(setbasedirhelper "$1");
  fi
  echo "Setting base directory to " $WD
  export WORKING_BASE_DIRECTORY="$WD"
}

# Print all valid tmux colors and their names
function tmuxcolors {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# ------------------------------------------------
# Ruby
# ------------------------------------------------
function allerb2html {
  ack -g --nocolor erb | xargs ruby -e 'puts %Q(Converting: #{ARGV.join(", ")})'
  ack -g --nocolor erb | xargs ruby -e 'ARGV.each { |i| puts %Q(html2haml -e #{i} #{i.sub(/erb$/,"haml")}) }' | bash
  ack -g --nocolor erb | xargs trash
}

# Shortcut for `bundle exec rails` and `bundle exec rake`.
# If script/rails and script/rake are available, use them instead as they are much
# faster to execute than `bundle exec`.
function r {
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

# ------------------------------------------------
# Node
# ------------------------------------------------
# Convenience to get node alias argument from command line parameter. Default: "default"
function getnodealias {
  DEFAULT_ALIAS=default

  if [[ -z "$1" ]]; then
    node_alias=$DEFAULT_ALIAS
  else
    node_alias=$1
  fi

  echo $node_alias
}

# Like 'bundle exec' for npm
# Reduces need for `npm install -g`
function n {
  `npm bin`/$@
}

# Install a new node version, reinstalling packages from another
function nvmir {
  if [[ -z "$1" ]]; then
    echo "Please supply a version to install."
    exit 1
  else
    if [[ -z "$2" ]]; then
      reinstall_packages_from=""
    else
      reinstall_packages_from="--reinstall-packages-from=$2"
    fi
  fi

  nvm install $1 $reinstall_packages_from
}

# (Re)create softlink at $NVM_DIR/bin/node
function relinknode {
  node_alias=$(getnodealias $1)
  echo "(Re)creating node executable softlink for $node_alias…"

  nvmbindir=$NVM_DIR/bin
  if [[ ! -d $nvmbindir ]]; then
    echo "$nvmbindir doesn't exist. Creating…"
    mkdir -p $nvmbindir
  fi

  nodelink=$NVM_DIR/bin/node
  if [[ -h $nodelink ]]; then
    echo "Removing current symlink at $nodelink"
    trash $nodelink
  fi

  ln -s $(nvm which $node_alias) $NVM_DIR/bin/node
  echo "Done"
}

# (Re)create softlink at $NVM_DIR/versions/node/$alias
function relinknodealias {
  node_alias=$(getnodealias $1)
  echo "(Re)creating softlink for node version alias $node_alias…"

  nodealiaslink=$NVM_DIR/versions/node/$node_alias
  if [[ -h $nodealiaslink ]]; then
    echo "Removing current symlink at $nodealiaslink"
    trash $nodealiaslink
  fi

  ln -s $(dirname $(nvm which $node_alias)) $nodealiaslink
  echo "Done"
}

# Set $NVM_BIN environment variable
function setnvmbin {
  node_alias=$(getnodealias $1)

  export NVM_BIN=$(dirname $(nvm which $node_alias))
}

# ------------------------------------------------
# Git
# ------------------------------------------------
# Show files changed in stash at specified position
function showStashFilesAt {
  git stash show stash@{$1}
}

# Show diff in stash at specified position
function showStashPatchAt {
  git stash show -p stash@{$1}
}


# ------------------------------------------------
# Base16 theme assistant
# ------------------------------------------------
function setBase16Theme {
  theme_name=$1
  base16_shell_path="$HOME/.config/base16-shell"

  if [[ -z $theme_name ]]; then
    echo 'Please provide a theme name.'
    return 1
  fi

  script_path="$base16_shell_path/scripts/$theme_name.sh"
  if [[ -f $script_path ]]; then
    echo "Setting terminal colorscheme to $theme_name."
    echo "Sourcing $script_path…"
    source $script_path
  fi
}
