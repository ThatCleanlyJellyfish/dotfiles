# Case insensitive completion. _ and - are interchangeable.
HYPHEN_INSENSITIVE="true"
# Display red dots whilst waiting for completion. Customise with
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"
# Make repository status check faster for large repos.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_IGNORE_ALL_DUPS="true"
# Commands prefixed with a space are not saved in history.
HIST_IGNORE_SPACE="true"
# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR=nvim
export SUDO_EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
# fzf key bindings and fuzzy completion
source <(fzf --zsh)
