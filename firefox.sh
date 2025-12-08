#!/bin/bash

set -e

echo "=== Downloading Firefox Nightly ==="
wget -O firefox-nightly.tar.bz2 "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"

echo "=== Extracting ==="
tar -xjf firefox-nightly.tar.bz2

echo "=== Installing to /opt ==="
sudo mv firefox /opt/firefox-nightly

echo "=== Creating symlink ==="
sudo ln -sf /opt/firefox-nightly/firefox /usr/local/bin/firefox-nightly

echo "=== Creating desktop entry ==="
cat << 'EOF' | sudo tee /usr/share/applications/firefox-nightly.desktop
[Desktop Entry]
Name=Firefox Nightly
Comment=Browse the Web
Exec=/opt/firefox-nightly/firefox %u
Icon=/opt/firefox-nightly/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
EOF

echo "=== Cleaning up ==="
rm firefox-nightly.tar.bz2

echo "=== Done! ==="
echo "Run 'firefox-nightly' or find it in your application menu."
