#!/bin/bash

. scripts/utils.sh
# . scripts/osx-defaults.sh
. scripts/symlinks.sh

# Update system and install essential packages
info "Updating package manager..."
sudo pacman -Syu --noconfirm

info "Dotfiles intallation initialized..."
read -p "Install apps? [y/n] " install_apps
read -p "Overwrite existing dotfiles? [y/n] " overwrite_dotfiles

# Confirm package installation
read -p "Proceed with installing the prerequisites and apps? [y/n] " confirm_install
if [[ "$confirm_install" != "y" ]]; then
    echo "Installation aborted."
    exit 1
fi

# Install packages
info "Installing apps"
install_packages() {
    local packages=("$@")
    for pkg in "${packages[@]}"; do
        if ! sudo pacman -S "$pkg"; then
            if ! yay -S "$pkg"; then
                error "Failed to install $pkg"
                exit 1
            fi
        fi
    done
}

# Prerequisites list
reqs=(
    zsh
    git
    cmake
    # Add more prerequisites here
)

# Apps list
apps=(
    # AUR packages
    aspell
    aspell-de
    aspell-en
    docker
    eza
    fzf
    gnome-shell-extensions
    gnome-system-monitor
    gnome-browser-connector
    grilo-plugins
    jre21-openjdk
    man-db
    ncdu
    neovim
    nodejs
    npm
    nvm
    obsidian
    proton-vpn-gtk-app
    ranger
    starship
    syncthing
    tldr
    tmux
    unrar
    vim
    vlc
    wezterm
    wl-clipboard
    yt-dlp
    zip
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    mousai
    # yay packages
    gnome-shell-extension-blur-my-shell
    moosync
    swingmusic-bin
    vlc-pause-click-plugin
    vscodium-bin
    # Add more apps here
)

fonts=(
    ttf-atkinson-hyperlegible
    ttf-jetbrains-mono
    inter-font
    ttf-jetbrains-mono-nerd
    # Add more fonts here
)

if [[ "$install_apps" == "y" ]]; then
    printf "\n"
    info "==================="
    info "Prerequisites"
    info "==================="

    install_packages "${reqs[@]}"

    printf "\n"
    info "==================="
    info "Apps"
    info "==================="

    install_packages "${apps[@]}"

    printf "\n"
    info "==================="
    info "Fonts"
    info "==================="

    install_packages "${fonts[@]}"
fi

# Set zsh as the default shell
if [[ "$SHELL" != "/bin/zsh" ]]; then
    printf "\n"
    info "Setting zsh as the default shell..."
    chsh -s $(which zsh)
    source ~/.zsh
fi

printf "\n"
info "===================="
info "Arch System Defaults"
info "===================="

# Add system defaults
# register_keyboard_shortcuts
# apply_osx_system_defaults

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
