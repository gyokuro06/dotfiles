#!/usr/bin/env sh

set -eu

readonly dotfiles_path=$(dirname $0)

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bash
ln -sf $dotfiles_path/bash $XDG_CONFIG_HOME/bash
# git
ln -sf $dotfiles_path/git $XDG_CONFIG_HOME/git
# vim
ln -sf $dotfiles_path/vim $XDG_CONFIG_HOME/vim
# zsh
ln -sf $dotfiles_path/zsh/.zshenv $HOME/.zshenv
mkdir -p $XDG_CONFIG_HOME/zsh
ln -sf $dotfiles_path/zsh/.zshrc $XDG_CONFIG_HOME/zsh/.zshrc
# asdf
ln -sf $dotfiles_path/.tool-versions $HOME/.tool-versions