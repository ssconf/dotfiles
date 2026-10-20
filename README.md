# Dotfiles

This repository contains my personal configuration files for a streamlined Linux development environment. It includes setup and styling for the terminal, window manager, status bar, compositor, and editor so I can quickly bootstrap or recreate a familiar setup across machines.

## Included Configurations

- zsh + Oh My Zsh + Powerlevel10k
- tmux with TPM plugin manager
- bspwm window manager
- sxhkd hotkey daemon
- polybar status bar
- picom compositor
- Neovim configuration

## Repository Layout

```text
.
├── .zshrc
├── .tmux.conf
├── bspwm/
├── picom/
├── polybar/
├── sxhkd/
├── nvim/
└── README.md
```

## Quick Start

Clone the repository:

```bash
git clone https://github.com/ssconf/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Symlink key files into your home directory:

```bash
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

For the desktop environment configs, link or copy them into `~/.config`:

```bash
mkdir -p ~/.config/{bspwm,sxhkd,polybar,picom,nvim}
ln -sf ~/.dotfiles/bspwm ~/.config/bspwm
ln -sf ~/.dotfiles/sxhkd ~/.config/sxhkd
ln -sf ~/.dotfiles/polybar ~/.config/polybar
ln -sf ~/.dotfiles/picom ~/.config/picom
ln -sf ~/.dotfiles/nvim ~/.config/nvim
```

## Notes

- The shell configuration uses a Powerlevel10k theme and includes useful plugins such as `zsh-syntax-highlighting` and `zsh-autosuggestions`.
- tmux is configured with a curated plugin set for improved productivity and session continuity.
- This repo is intended to be adapted to your own machine and workflow; review the config files before applying them.

## Customization

You can tweak any of the config files to match your preferences. The most common places to personalize are:

- `~/.zshrc` for aliases, PATH additions, and shell behavior
- `~/.tmux.conf` for keybindings and plugin configuration
- `bspwm/`, `sxhkd/`, `polybar/`, and `picom/` for desktop environment preferences
- `nvim/` for editor defaults and plugins

## License

This project is provided as-is for personal use. Feel free to adapt it to your own setup.
