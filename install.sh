#!/usr/bin/env bash
set -e

cd "$HOME/dotfiles"

stow .

mkdir -p "$HOME/.config"

ln -sfn "$HOME/dotfiles/.config/mimeapps.list" "$HOME/.config/mimeapps.list"
