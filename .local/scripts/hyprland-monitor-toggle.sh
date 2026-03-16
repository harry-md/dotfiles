#!/usr/bin/env bash

if ! hyprctl monitors | grep -q "HDMI-A-1"; then
    hyprctl keyword monitor "eDP-1,1920x1080@60,0x1080,1"
    notify-send "Hyprland" "External monitor not found!"
    exit 1
fi

if hyprctl monitors | grep -q "eDP-1"; then
    hyprctl keyword monitor "eDP-1,disable"
    notify-send "Hyprland" "Turned off Laptop screen"
else
    hyprctl keyword monitor "eDP-1,1920x1080@60,0x1080,1"
    notify-send "Hyprland" "Turned on Laptop screen"
fi
