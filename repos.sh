#!/bin/bash

# Exit on error
set -e

echo "=== Enabling RPM Fusion repositories ==="
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "=== Updating system ==="
sudo dnf update -y

echo "=== Done! ==="
