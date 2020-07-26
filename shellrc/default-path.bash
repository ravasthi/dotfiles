# Set default paths explicitly, since it doesn't seem to be happening.
if [[ -x /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi
# echo "After running path_helper: " $PATH
