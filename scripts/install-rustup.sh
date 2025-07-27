#!/bin/bash

sudo pacman -R rust # Remove system Rust (to avoid conflicts)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.zshrc
. "$HOME/.cargo/env"
