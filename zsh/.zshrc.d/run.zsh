run() {
  # Start a process in the background and disown it; hiding all output.
  "$@" > /dev/null 2>&1 & disown
}
_run() {
  # Complete the first arg to `run` as a command name, then others as normal.
  if (( CURRENT == 2 )); then
    _command_names
  else
    # Shift the words so $words[2] becomes the command
    local -a cmdwords
    cmdwords=("${words[@]:1}")
    (( CURRENT-- ))
    _call_function ret _${cmdwords[1]} || _default
  fi
}
compdef _run run
