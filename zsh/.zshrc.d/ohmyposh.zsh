export PATH="$HOME/.local/bin:$PATH"
eval "$(oh-my-posh init zsh --config $ZSH_CUSTOM/prompt.omp.yaml)"
# Pass the number of background jobs to oh-my-posh for the prompt.
function set_poshcontext() {
  export BG_JOBS=$(jobs | wc -l | xargs)
}
