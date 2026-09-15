#!/usr/bin/env bash
#
# fedora-post-install.sh
# Post-install setup script for a Fedora desktop (daily driver)
# Run with: chmod +x fedora-post-install.sh && ./fedora-post-install.sh
#
set -euo pipefail

echo "=== Fedora Post-Install Setup ==="

# --- Sanity checks ---
if [[ $EUID -eq 0 ]]; then
  echo "Please run this as a normal user (it will sudo when needed), not as root."
  exit 1
fi

FEDORA_VERSION=$(rpm -E %fedora)
echo "Detected Fedora $FEDORA_VERSION"

# --- System update ---
echo "--- Updating system ---"
sudo dnf upgrade --refresh -y

# --- nable RPM Fusion (free + nonfree) ---
echo "--- Enabling RPM Fusion repos ---"
sudo dnf install -y \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_VERSION}.noarch.rpm"

sudo dnf group upgrade -y core

# --- Multimedia codecs ---
echo "--- Installing multimedia codecs ---"
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf group install -y multimedia
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 \
  gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel

# --- Hardware video acceleration (Intel/AMD) ---
echo "--- Setting up hardware acceleration (skipped) ---"
# sudo dnf install -y libva libva-utils

# --- Common desktop applications ---
echo "--- Installing common apps ---"
sudo dnf install -y --skip-unavailable \
  qbittorrent \
  kitty \
  zsh \
  gimp \
  thunderbird \
  vlc \
  obs-studio \
  audacity \
  flatpak \
  git \
  lazygit \
  virt-manager \
  btop \
  ripgrep \
  fzf \
  fd-find \
  python3 \
  python3-pip \
  rustup \
  gnupg2 \
  zathura \
  libreoffice \
  steam \
  vlc \
  gimp \
  firefox \
  htop \
  neofetch \
  git \
  curl \
  wget \
  unzip \
  p7zip \
  p7zip-plugins \
  unrar \
  timeshift \
  gnome-tweaks \
  dnf-plugins-core \
  sqlite \
  sqlite-devel \
  sqlite-libs \
  texlive-scheme-full

# --- Flatpak + Flathub ---
echo "--- Setting up Flatpak ---"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Popular Flatpak apps — comment out any you don't want
flatpak install -y flathub \
  org.telegram.desktop \
  io.gitlab.librewolf-community \
  com.dropbox.Client \
  org.signal.Signal \
  com.bitwarden.desktop \
  com.discordapp.Discord \
  com.visualstudio.code \
  com.brave.Browser

# --- Python Pip Packages  ---
echo "--- Installing Python Pip Packages ---"
python3 -m ensurepip --upgrade
pyhton3 -m pip install --upgrade pip
python3 -m pip install neovim-remote
python3 -m pip install mmdc

sh ./github-settings.sh

# --- Firmware updates ---
echo "--- Checking firmware updates ---"
sudo fwupdmgr refresh --force || true
sudo fwupdmgr get-updates || true
sudo fwupdmgr update -y || true

# # --- System tweaks ---
# echo "--- Applying tweaks ---"
# # Enable tap-to-click on touchpads (GNOME)
# gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true || true
# j
# # Reduce swappiness for desktop responsiveness
# echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf

# --- Change default shell ---
# Change the default shell for the current user to zsh
chsh -s "$(which zsh)" "$USER"
echo "Default shell changed to zsh. Log out and back in (or reboot) for it to take effect."

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# ---  Cleanup ---
echo "--- Cleaning up ---"
sudo dnf autoremove -y
sudo dnf clean all

echo "=== Done! A reboot is recommended. ==="
