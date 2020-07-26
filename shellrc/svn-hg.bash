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
