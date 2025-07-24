#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

install_vscode_extensions() {
    info "Installing VSCodium extensions..."

    # List of Extensions
    extensions=(
        eamodio.gitlens
        esbenp.prettier-vscode
        github.github-vscode-theme
        mechatroner.rainbow-csv
        ms-azuretools.vscode-containers
        ms-azuretools.vscode-docker
        ms-python.black-formatter
        ms-python.debugpy
        ms-python.flake8
        ms-python.isort
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        mtxr.sqltools
        redhat.vscode-yaml
        ritwickdey.liveserver
        theqtcompany.qt-core
        theqtcompany.qt-qml
        vscode-icons-team.vscode-icons
        vscodevim.vim

    )

    for e in "${extensions[@]}"; do
        codium --install-extension "$e"
    done

    success "VSCodium extensions installed successfully"
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    install_vscode_extensions
fi
