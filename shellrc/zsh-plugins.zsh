# This file includes initializations for any plugins installed separately from oh-my-zsh
if [[ -e $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  # echo "Initializing zsh-syntax-highlighting…"
  source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
