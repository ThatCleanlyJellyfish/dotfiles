# Adrian's Dotfiles

Dotfiles for my development environment. Also includes `setup.sh` to get things
up and running on a new install.

### Alacritty

Zsh, Meslo Nerd Font and Tokyonight theme.

### Git

Git config with pretty aliases and sane defaults. Also a better `git mergetool`
implementation using Neovim and diffconflicts.

### IPython

Enable true colour. Fixes unreadable completion list on some terminals.

### Less

Center search results, always parse colour codes and default to case insensitive
search.

### Neovim

Full config based around `kickstart.nvim`. `:` and `;` bindings flipped ;) Lots
of LSPs: CMake, clangd, ruff, pyright, Verible, yamlls. Tokyonight theme.

### Regolith

No gaps solarized theme. In the process of conversion to Tokyonight. Config for
STM32Cube dialogs.

### Zsh

`oh-my-zsh` + `oh-my-posh`. `evalcache` for pretty prompt with fast startup
(0.19 seconds on my machine). Default prompt with Git repo status,
Git-repo-relative path, current Venv. Minimal prompt also included.
