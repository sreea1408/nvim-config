#!/bin/bash

print_user_info () {
    echo
    echo "######################################################################################################################"
    echo "INFO: " $1
    echo "######################################################################################################################"
    echo
}

if [ "$1" = "--help" ]; then
    echo "./install.sh [remote]"
    exit 0
fi

if [[ -x $(builtin type -P "rustc") ]] && [[ -x $(builtin type -P "cargo") ]]; then
    :
else
    print_user_info "Installing rust and cargo..."
    # https://doc.rust-lang.org/cargo/getting-started/installation.html
    curl https://sh.rustup.rs -sSf | sh
fi

# install tree-sitter cli
cargo install tree-sitter-cli --version 0.20.7

# install ripgrep
cargo install ripgrep --version 13.0.0

if [[ -x $(builtin type -P "node") ]] && [[ -x $(builtin type -P "npm") ]]; then
    :
else
    print_user_info "Installing Node.js"
    wget https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.xz
    tar xvf node-v18.12.1-linux-x64.tar.xz -C ~
    rm node-v18.12.1-linux-x64.tar.xz
    print_user_info "Update PATH: PATH=\$HOME/node-v18.12.1-linux-x64/bin:\$PATH"
fi

if [ "$1" != "remote" ]; then
    if [[ -x $(builtin type -P "xclip") ]]; then
        :
    else
        print_user_info "Install xclip: sudo apt install xclip"
    fi

    mkdir -p ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d ~/.local/share/fonts
    rm JetBrainsMono.zip
    print_user_info "Set terminal font to JetBrainsMono Nerd Font Regular"
fi

