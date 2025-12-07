#!/bin/bash

# Read commands from file and present in tofi
selected=$(cat ~/.config/waybar/scripts/nmcli_commands.txt | tofi --prompt-text "nmcli: ")

# If a command was selected, open foot with the command pre-filled for editing
if [ -n "$selected" ]; then
    tmpdir=$(mktemp -d)
    cat > "$tmpdir/.zshrc" << EOF
source ~/.zshrc
print -z '$selected'
rm -rf '$tmpdir'
EOF
    ZDOTDIR="$tmpdir" foot zsh -i
fi
