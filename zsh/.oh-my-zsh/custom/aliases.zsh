alias fd='fdfind --no-ignore --hidden'
alias stow='stow -v'

alias ls='ls --color=tty --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'

alias gch='git checkout'
alias grbd='git rebase origin/$(git_develop_branch)'
alias grbm='git rebase origin/$(git_main_branch)'

alias pyv='. ./$1/.venv/bin/activate'

alias tf='terraform'
