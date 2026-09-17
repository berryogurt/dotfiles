#!/usr/bin/env bash
#
# fedora-post-install.sh
# Post-install setup script for a Fedora desktop (daily driver)
# Run with: chmod +x fedora-post-install.sh && ./fedora-post-install.sh
#
set -euo pipefail

consent="y" # assumeno for testing

dnf_common_apps=(qbittorrent
  kitty
  zsh
  gimp
  thunderbird
  vlc
  obs-studio
  audacity
  flatpak
  git
  lazygit
  virt-manager
  btop
  ripgrep
  fzf
  fd-find
  python3
  python3-pip
  rustup
  gnupg2
  zathura
  libreoffice
  steam
  vlc
  gimp
  firefox
  htop
  neofetch
  git
  curl
  wget
  unzip
  p7zip
  p7zip-plugins
  unrar
  timeshift
  gnome-tweaks
  dnf-plugins-core
  sqlite
  sqlite-devel
  sqlite-libs
  texlive-scheme-full
)

flatpaks=(
  flathub
  org.telegram.desktop
  io.gitlab.librewolf-community
  com.dropbox.Client
  org.signal.Signal
  com.bitwarden.desktop
  com.discordapp.Discord
  com.visualstudio.code
  com.brave.Browser
)

pip_packages=(
  pip
  neovim-remote
  mmdc
)

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
sudo dnf upgrade --refresh -$consent -q # operates quietly and automatically

# --- nable RPM Fusion (free + nonfree) ---
echo "--- Enabling RPM Fusion repos ---"
sudo dnf install -$consent -q \
  "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_VERSION}.noarch.rpm"

echo "--- Upgrading Core Group ---"
sudo dnf group upgrade -$consent -q core

# --- Multimedia codecs ---
echo "--- Installing multimedia codecs ---"
sudo dnf swap -$consent -q ffmpeg-free ffmpeg --allowerasing
sudo dnf group install -$consent -q multimedia
sudo dnf install -$consent -q gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 \
  gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -$consent -q lame\* --exclude=lame-devel

# --- Hardware video acceleration (Intel/AMD) ---
echo "--- Setting up hardware acceleration (skipped) ---"
# sudo dnf install -$consent -q libva libva-utils

# --- Installing common desktop applications ---
for pkg in "${dnf_common_apps[@]}"; do
  echo "$pkg"
done
echo "--- Installing common apps ---"
sudo dnf install -$consent -q --skip-unavailable "${dnf_common_apps[@]}"

# --- Flatpak + Flathub ---
echo "--- Setting up Flatpak ---"
for pkg in "${flatpaks[@]}"; do
  echo "$pkg"
done
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -noninteractive "${flatpaks[@]}"

# --- Python Pip Packages  ---
echo "--- Installing Python Pip Packages ---"
for pkg in "${pip_packages[@]}"; do
  echo "$pkg"
done
python3 -m ensurepip --upgrade
pyhton3 -m pip install --upgrade "${pip_packages[@]}"

# --- Set symlinks for dotfiles
echo "--- Setting Symlinks for dotfiles ---"
. ./src/symlinks.sh

# --- Set Github Settings
echo "--- Setting Git Settings ---"
. ./src/git-settings.sh

# --- Install Oh-My-Zsh
echo "--- Installing oh my zsh ---"
. ./src/zsh.sh

# --- Set Gnome Options ---
echo "--- Setting Gnome Options ---"
. ./src/gnome-settings.sh

# --- Firmware updates ---
echo "--- Checking firmware updates ---"
sudo fwupdmgr refresh --force || true
sudo fwupdmgr get-updates || true
sudo fwupdmgr update -$consent || true

# # Reduce swappiness for desktop responsiveness
# echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf

# ---  Cleanup ---
echo "--- Cleaning up ---"
sudo dnf autoremove -$consent -q
sudo dnf clean all

echo "=== Done! A reboot is recommended. ==="
