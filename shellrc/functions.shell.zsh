# --------------------------------------------------------------------------------------------------
# ZSH-specific functions
# --------------------------------------------------------------------------------------------------
function startzshcommandtrace {
  echo "Starting zsh command tracing…"
  set -x

  # Redirects trace output to zsh.err
  if [[ "$1" == "--redirect-trace-output" ]] || [[ "$1" == "-r" ]]; then
    echo "Redirecting trace output to zsh.err."
    exec 2>zsh.err
  fi
}

function stopzshcommandtrace {
  echo "Stopping zsh command tracing…"
  set +x

  # In case trace output was redirected to zsh.err, pipe it back to the terminal.
  if [[ -t 2 ]]; then
    echo "Trace output unchanged."
  else
    echo "Restoring trace output to terminal."
    exec 2>/dev/tty
  fi
}
