##############################################################################
# Set up oh-my-zsh and load the zshrc.d plugin. Further config is done through
# $HOME/.zshrc.d/*.zsh
##############################################################################
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:plugins:nvm' lazy yes
ZSH_TMUX_AUTOSTART="true"
plugins=(
	aliases
	colored-man-pages
	command-not-found
	dirpersist
	evalcache
	extract
	git
	nvm
	tmux
	vi-mode
	zoxide
	zshrc.d
)
source $ZSH/oh-my-zsh.sh
# `colored-man-pages` makes `less` search highlights hard to see. Fix that...
less_termcap[so]="${fg_bold[black]}${bg[yellow]}"
