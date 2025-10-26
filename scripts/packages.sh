#!/bin/bash

reqs=(
    zsh
    git
    cmake
    # Add more prerequisites here
)

pacman_apps=(
    docker
    eza
    fzf
    firfox
    # gnome-shell-extensions
    # gnome-system-monitor
    # gnome-browser-connector
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
    wl-clipboard
    ffmpeg
    yt-dlp
    zip
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    mousai
    fastfetch
    hyprsunset
    qbittorrent
    reflector
    telegram-desktop
    tesseract-data-eng
    tesseract-data-deu
    # Add more apps here
)

yay_apps=(
    wezterm-git
    anki
    mpv
    # gnome-shell-extension-blur-my-shell
    wora-bin
    vscodium-bin
    ticktick
    stayfree
    onlyoffice-bin
    subliminal-git
    notesnook
    restic
    backrest
    open-android-backup
    syncthing-appmenu
    flutter-bin
    # Add more apps here
)

fonts=(
    ttf-atkinson-hyperlegible-next
    ttf-jetbrains-mono
    inter-font
    ttf-jetbrains-mono-nerd
    # Add more fonts here
)

dependencies=(
    vulkan-icd-loader
    vulkan-mesa-layers
    vulkan-tools
    vulkan-intel
    alsa-plugins
    cpio
)
