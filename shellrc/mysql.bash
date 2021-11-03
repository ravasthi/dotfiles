# --------------------------------------------------------------------------------------------------
# MySQL
# --------------------------------------------------------------------------------------------------

if [[ -d $HOMEBREW_PREFIX/mysql/bin ]]; then
  export PATH=$HOMEBREW_PREFIX/mysql/bin:$PATH
fi
# echo "After updating for mysql: " $PATH
