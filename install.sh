#!/bin/bash

. scripts/utils.sh
. scripts/prerequisites.sh
. scripts/symlinks.sh
. scripts/install-packages.sh
. scripts/install-yay.sh
. scripts/set-zsh.sh
. scripts/packages.sh

# Update system and install essential packages
info "Updating package manager..."
sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

info "Dotfiles intallation initialized..."
read -rp "Install apps? [y/n] " install_apps
read -rp "Overwrite existing dotfiles? [y/n] " overwrite_dotfiles

# Confirm package installation
read -rp "Proceed with dotfiles installation? [y/n] " confirm_install
if [[ "$confirm_install" != "y" ]]; then
    echo "Installation aborted."
    exit 1
fi

info "Installing apps"

if [[ "$install_apps" == "y" ]]; then
    printf "\n"
    info "========================="
    info "Prerequisites"
    info "========================="

    install_yay
    install_packages "${reqs[@]}"
    install_packages "${dependencies[@]}"

    printf "\n"
    info "========================="
    info "Apps"
    info "========================="

    install_packages "${pacman_apps[@]}"
    install_packages "${yay_apps[@]}"

    printf "\n"
    info "========================="
    info "Fonts"
    info "========================="

    install_packages "${fonts[@]}"
fi

info "Setting zsh as default shell"
set_zsh

printf "\n"
info "===================="
info "Arch System Defaults"
info "===================="

printf "\n"
info "===================="
info "Terminal"
info "===================="

info "Adding .hushlogin file to suppress 'last login' message in terminal..."
touch ~/.hushlogin

printf "\n"
info "===================="
info "Symbolic Links"
info "===================="

chmod +x ./scripts/symlinks.sh
if [[ "$overwrite_dotfiles" == "y" ]]; then
    warning "Deleting existing dotfiles..."
    ./scripts/symlinks.sh --delete --include-files
fi
./scripts/symlinks.sh --create

success "Dotfiles set up successfully."
