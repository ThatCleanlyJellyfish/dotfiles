autoload -Uz _completion_loader
run() {
  # Start a process in the background and disown it; hiding all output.
  "$@" > /dev/null 2>&1 & disown
}
_run() {
  # Complete the first arg to `run` as a command name, then others as normal.
  if (( CURRENT == 2 )); then
    _command_names
  else
    local -a cmdwords
    cmdwords=("${words[@]:1}")
    local cmd="${cmdwords[1]}"
    (( CURRENT-- ))
    local fn="_${cmd}"
    # Check if function is already defined or defined in fpath
    if whence -w "$fn" &>/dev/null || [[ -n ${(M)fpath:#*/$fn(N)} ]]; then
      type "$fn" &>/dev/null || autoload -Uz "$fn"
      "$fn"
    else
      _default
    fi
  fi
}
compdef _run run
