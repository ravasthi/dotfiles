# --------------------------------------------------------------------------------------------------
# ZSH-specific aliases
# --------------------------------------------------------------------------------------------------

alias redirecttraceoutput='export PS4="%D{%s.%9.}+%N:%i> "; exec 2>zsh.err'
alias restoretraceoutput='exec 2>/dev/tty; export PS4="+%N:%i> "'
alias startzshcommandtrace='set -x'
alias stopzshcommandtrace='set +x'
