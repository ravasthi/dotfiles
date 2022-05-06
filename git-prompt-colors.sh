# This is the custom theme template for gitprompt.sh

# These are the defaults from the "Default" theme
# You just need to override what you want to have changed
override_git_prompt_colors() {
  if [[ $- == *i* ]]; then
    if [[ -e ~/.rvm/bin/rvm-prompt ]]; then
      RubyPrompt='$(~/.rvm/bin/rvm-prompt i v)'
    elif command -v rbenv > /dev/null; then
      CurrentRuby='$(rbenv version-name)'
      CurrentGemset='$(rbenv gemset active 2>/dev/null | gsed -E "s/([^ ]+)( [^ ]+)*/\1/")'

      if [[ -n $CurrentGemset ]]; then
        RubyPrompt="$CurrentRuby@$CurrentGemset"
      else
        RubyPrompt="$CurrentRuby"
      fi
    elif command -v asdf > /dev/null; then
      RubyPrompt=`ruby -v | gsed -E 's/(ruby)\s+v?(\S+)\s+(.*)$/\1-\2/'`
    fi
  else
    RubyPrompt=""
  fi

  if [[ -d $HOME/.nvm ]]; then
    NodeVersion=`nvm current | gsed 's/v\(.*\)/\1/'`
  elif [[ -x $HOMEBREW_PREFIX/bin/nodenv ]]; then
    NodeVersion=`nodenv version | gsed -E 's/(^([[:digit:]]+\.?)+)( .*)$/\1/'`
  elif command -v asdf > /dev/null; then
    NodeVersion=`node -v | gsed -E 's/v(.*)/\1/'`
  else
    NodeVersion=""
  fi

  NodePrompt="${Cyan}(node-${NodeVersion})${ResetColor}"

  GIT_PROMPT_THEME_NAME="Richa"

  UserHost="${Magenta}\u${ResetColor}"
  PathShort="\w";

  # Only show host if not on local machine
  if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && [[ "$TERM_PROGRAM" != "iTerm.app" ]]; then
    UserHost="${Magenta}\u${ResetColor}@${Magenta}\h${ResetColor}"
  fi

  GIT_PROMPT_SEPARATOR=" | "

  GIT_PROMPT_BRANCH="${Cyan}"
  GIT_PROMPT_STAGED="${Blue}✚ "
  GIT_PROMPT_CONFLICTS=" ${Red}✖ "
  GIT_PROMPT_CHANGED=" ${Yellow}● "

  GIT_PROMPT_UNTRACKED=" ${Magenta}… "
  GIT_PROMPT_STASHED=" ${BoldBlack}⚑ "
  GIT_PROMPT_CLEAN="${BoldGreen}✽"

  GIT_PROMPT_COMMAND_OK="${Green}✔${ResetColor}"
  GIT_PROMPT_COMMAND_FAIL="${Red}✘${ResetColor}"

  GIT_PROMPT_VIRTUALENV="(${Blue}_VIRTUALENV_${ResetColor}) "

  GIT_PROMPT_START_USER="\n${UserHost} : ${Blue}${PathShort}${ResetColor} ${Red}(${RubyPrompt})${ResetColor} ${NodePrompt}${White}"
  GIT_PROMPT_END_USER="\n${ResetColor}[${Yellow}\A${ResetColor}]_LAST_COMMAND_INDICATOR_ "
  GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
  GIT_PROMPT_END_ROOT="${GIT_PROMPT_END_USER}"
}

reload_git_prompt_colors "Richa"
