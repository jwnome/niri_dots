#!/bin/bash

# Exit on error
set -e

echo "=== Enabling RPM Fusion repositories ==="
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "=== Enabling Google Chrome repository ==="
sudo dnf install -y fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

echo "=== Adding VSCodium repository ==="
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee /etc/yum.repos.d/vscodium.repo

echo "=== Updating system ==="
sudo dnf update -y

echo "=== Done! ==="
