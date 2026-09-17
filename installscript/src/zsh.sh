#!/usr/bin/env bash

# --- Change default shell ---
# Change the default shell for the current user to zsh
chsh -s "$(which zsh)" "$USER"
echo "--- Changed Shell to zsh. Log out needed. ---"

# Install Oh My Zsh
echo "--- Installing Oh My Zsh ---"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
