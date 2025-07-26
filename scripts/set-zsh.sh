#!/bin/bash

set_zsh() = {
    if [[ "$SHELL" != "/bin/zsh" ]]; then
        printf "\n"
        info "Setting zsh as the default shell..."
        chsh -s $(which zsh)
        if [[ $? -ne 0 ]]; then
            error "Failed to change default shell to zsh"
            exit 1
        fi
        source ~/.zshrc
    fi
}
