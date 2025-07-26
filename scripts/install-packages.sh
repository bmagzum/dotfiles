#!/bin/bash

install_packages() {
    local packages=("$@")
    for pkg in "${packages[@]}"; do
        if ! sudo pacman -S --noconfirm "$pkg"; then
            if ! yay -S --noconfirm "$pkg"; then
                error "Failed to install $pkg"
                exit 1
            fi
        fi
    done
}
