#!/bin/bash

# Enable multilib repository
# Uncomment:
#   [multilib]
#   Include = /etc/pacman.d/mirrorlist

install-steam() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S steam --noconfirm
    sudo pacman -S protonup-qt -- noconfirm
}
