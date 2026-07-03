# /etc/zprofile runs immediately after ~/.zshenv and unconditionally invokes
# /usr/libexec/path_helper, which rebuilds PATH from /etc/paths and
# /etc/paths.d/* and appends everything else after — undoing the ordering
# ~/.zshenv just established (Homebrew, asdf, language toolchains ahead of
# the system /usr/bin, /usr/sbin, etc.). This file runs right after
# /etc/zprofile in the startup sequence, so restore the order here instead
# of patching the system file, which macOS overwrites on every OS upgrade.
if [[ -n "$_DOTFILES_ZSHENV_PATH" ]]; then
  export PATH="$_DOTFILES_ZSHENV_PATH"
fi
