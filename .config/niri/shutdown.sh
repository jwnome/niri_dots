#!/bin/bash
killall waybar
swww img ~/Wallpapers/wallpaper-black.png --transition-type simple --transition-duration 0.25
sleep 0.3
systemctl poweroff
