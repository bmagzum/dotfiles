# Dotfiles

This directory contains the dotfiles for my system.

## Tools

- **Editor**: [Neovim](https://neovim.io/) is built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) following [Full Neovim Setup from Scratch in 2025 - YouTube](https://www.youtube.com/watch?v=KYDG3AHgYEs)
- **Multiplexer**: [Tmux](https://github.com/tmux/tmux/wiki)
- **Main Terminal**: [WezTerm](https://wezterm.org/)
- **Shell Prompt**: [Starship](https://starship.rs/)
- **Color Theme**: Themes are based on [GitHub Color Scheme](https://primer.style/brand/primitives/color/)
- **Terminal File Manager**: [Ranger](https://github.com/ranger/ranger)

## Setup

To set up these dotfiles, run:

```bash
./install.sh
```

## Uninstalling

To delete all symlinks created by the installation script, run:

```bash
./scripts/symlinks.sh --delete
```

This will remove the symlinks but will not delete the actual configuration files, allowing you to easily revert to your previous configuration if needed.

## Adding New Dotfiles and Software

### Dotfiles

When adding new dotfiles to this repository, follow these steps:

1. Place your dotfile in the appropriate location within the repository.
2. Update the `symlinks.conf` file to include the symlink creation for your new dotfile.
3. If necessary, update the `install.sh` script to set up the software.

## Sources

- [hendrikmi/dotfiles](https://github.com/hendrikmi/dotfiles): dotfile, neovim, wezterm setup
- [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland): quickshell
- [gaurav23b/simple-hyprland](https://github.com/gaurav23b/simple-hyprland): hyprland
