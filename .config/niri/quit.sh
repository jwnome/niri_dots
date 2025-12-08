#!/bin/bash
killall waybar
awww img ~/Wallpapers/wallpaper-black.png --transition-type simple --transition-duration 0.5
sleep 1.5
niri msg action quit --skip-confirmation
