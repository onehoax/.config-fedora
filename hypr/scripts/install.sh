#!/usr/bin/env bash

# =============================== MAIN PACKAGES AND DEPS ===============================

# 1. Enable RPM Fusion repos (if not already)
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# 2. Install proprietary NVIDIA drivers (for laptops)
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda nvidia-vaapi-driver -y

# Optional (for Steam/games using 32-bit libs)
sudo dnf install libva-utils libvdpau-va-gl -y

# 3. Disable nouveau
sudo bash -c 'echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nouveau.conf'
sudo dracut --force

# 4. Enable DRM modeset (required by Hyprland)
echo "options nvidia_drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf

# Enable the repo
sudo dnf copr enable solopasha/hyprland

# Install Hyprland and some extras
sudo dnf install hyprland xdg-desktop-portal-hyprland

# Must haves 
sudo dnf install mako pipewire wireplumber \
  qt5-qtwayland qt6-qtwayland \
  google-noto-sans-fonts \
  hyprpolkitagent

sudo reboot


# =============================== FONTS ===============================

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip
rm Hack.zip
fc-cache -fv
fc-list | grep "Hack Nerd Font"


# =============================== UTILS ===============================

sudo dnf install hyprlauncher hyprpaper hyprlock \
                 hypridle hyprsunset hyprsysteminfo \
                 waybar blueman

