#!/usr/bin/env bash
# --- Set symlinks for config files ---
rm -rfv \
  ~/.zshrc \
  ~/.bashrc \
  ~/.indentconfig.yaml \
  ~/.config/nvim/ \
  ~/.config/kitty \
  ~/.config/zathura/ \
  ~/.config/fish/ \
  ~/.fonts/

ln -sfnv ~/dotfiles/.zshrc ~/
ln -sfnv ~/dotfiles/.bashrc ~/
ln -sfnv ~/dotfiles/.indentconfig.yaml ~/
ln -sfnv ~/dotfiles/.config/nvim ~/.config
ln -sfnv ~/dotfiles/.config/kitty ~/.config
ln -sfnv ~/dotfiles/.config/zathura ~/.config
ln -sfnv ~/dotfiles/.config/fish ~/.config
ln -sfnv ~/dotfiles/.config/alacritty ~/.config
ln -sfnv ~/dotfiles/.fonts ~/

fc-cache -f
