#!/bin/bash
# Exit on first error.
set -e
# Print all commands before running.
set -x
# Setup for new Debian install. Should mostly work for Ubuntu too.
# WARN: This script is designed to be as unattended as possible, but it's not
# well tested!

#################
### VARIABLES ###
#################
GIT_NAME="Adrian Wheeldon"
GIT_EMAIL="adrian@literal-labs.ai"
# Options: "stable", "nightly", version number, commit hash
NVIM_VERSION=88774965e5c0b091058b26a0ecc71ca254212f37


#################
### FUNCTIONS ###
#################
setup_github_key() {
    # Set up the SSH key first to get user prompts out of the way.
    ssh-keygen -q -N "" -f ~/.ssh/github.com
    echo "IdentityFile ~/.ssh/github.com" >> ~/.ssh/config
    cat ~/.ssh/github.com.pub
    read -p "Add the above SSH key to your Github profile and press enter to continue."
}

update_os_and_install_deps() {
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update --assume-yes
    sudo apt-get \
        --assume-yes \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        upgrade
    sudo apt-get install --assume-yes btop fd-find fzf kitty-terminfo ripgrep stow unzip xclip zoxide zsh
}

setup_zsh() {
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -s https://ohmyposh.dev/install.sh | bash -s
    # Change default shell to zsh
    sudo chsh -s "$(which zsh)" "$USER"
}

dotfiles() {
    # Accept new host fingerprint.
    GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new" \
        git clone --recurse-submodules git@github.com:ThatCleanlyJellyfish/dotfiles.git
    # rm Zsh defaults as we replace with our own zshrc in the next step.
    rm -f .zshrc
    cd dotfiles
    stow git ipython less neovim tmux zsh
    cd ~
    echo -e "[user]\n\tname = $GIT_NAME\n\temail = $GIT_EMAIL" > ~/.gitconfig_user
}

neovim() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # Source Cargo env for this setup. This is already taken care of in dotfiles for
    # later shell invocations.
    . "$HOME/.cargo/env"
    cargo install --git https://github.com/MordechaiHadad/bob --locked
    yes | bob use $NVIM_VERSION
}

nodejs() {
    # Needed for pyright and yamlls.
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
}

literal_lib() {
    git clone git@github.com:literal-labs/literal-lib.git
    cd literal-lib/pipeline
    # Set up the Python virtual environment.
    make init
}


#################
###   MAIN    ###
#################
# Executes in whatever shell this script is first invoked with.
if [ -z "${IN_ZSH:-}" ]; then
    setup_github_key # This step is interactive, so do it early!
    update_os_and_install_deps

    # Setup ZSH and execute the rest of the script with it.
    setup_zsh
    dotfiles
    export IN_ZSH=1
    exec zsh "$0" "$@"
fi

# Executes in ZSH after ZSH has been installed and set up.
if [ "$IN_ZSH" = "1" ]; then
    neovim # Needs paths set up in ZSH
    # nodejs # Needs paths set up in ZSH
    literal_lib # Needs paths set up in ZSH
fi
