#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

# Install yay
install_yay() {
    command -v yay >/dev/null 2>&1 || {
        info "yay not found, installing..."
        cd
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        makepkg -si --noconfirm
        cd - || exit 1
    }
}
