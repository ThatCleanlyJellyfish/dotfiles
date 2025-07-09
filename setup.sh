#!/bin/bash -e
# Setup for new Debian install. Should mostly work for Ubuntu too.
# WARN: this script is not unattended!
# WARN: this script is not properly tested!

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install btop fd-find fzf kitty-terminfo ripgrep stow xclip zoxide zsh

#########################
# Rustup + Bob + Neovim #
#########################
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Source Cargo env for this setup. This is already taken care of in dotfiles for
# later shell invocations.
. "$HOME/.cargo/env"
cargo install bob-nvim
bob use stable

######################
# SSH Key for Github #
######################
ssh-keygen -q -N "" -f ~/.ssh/github.com
echo "IdentityFile ~/.ssh/github.com" >> ~/.ssh/config
cat ~/.ssh/github.com.pub
read -p "Add the above SSH key to your Github profile and press any key to continue."

######################################
# oh-my-zsh + oh-my-posh + evalcache # 
######################################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -s https://ohmyposh.dev/install.sh | bash -s
# Change default shell to zsh
sudo chsh -s $(which zsh) $USER

################
# nvm + nodejs #
################
# Needed for pyright and yamlls.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

############
# Dotfiles #
############
# rm any zshrc which has been set up during above installs. We will replace it
# with the one from dotfiles.
rm -f ~/.zshrc
git clone --recurse-submodules git@github.com:ThatCleanlyJellyfish/dotfiles.git
cd dotfiles
stow git ipython less neovim zsh

###############
# literal-lib #
###############
git clone git@github.com:literal-labs/literal-lib.git
cd literal-lib/pipeline
make init
