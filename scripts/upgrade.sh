#!/bin/bash

# firmware
fwupdmgr refresh
fwupdmgr get-updates
sudo fwupdmgr update

# dnf
sudo dnf check-upgrade
sudo dnf upgrade --refresh
sudo dnf autoremove
sudo dnf clean all

# flatpak
flatpak update

# fedora version
#cat /etc/fedora-release
#sudo dnf upgrade --refresh


