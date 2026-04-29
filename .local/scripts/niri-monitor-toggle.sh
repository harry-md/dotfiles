#!/usr/bin/env bash

OUTPUTS=$(niri msg outputs)

if ! echo "$OUTPUTS" | grep -q "HDMI-A-1"; then
    niri msg output eDP-1 on
    notify-send "Niri Monitor" "External monitor not found! Laptop screen ON."
    exit 1
fi

if echo "$OUTPUTS" | grep -A 10 'eDP-1' | grep -q 'Logical size'; then
    niri msg output eDP-1 off
    notify-send "Niri Monitor" "Disabled Laptop screen"
else
    niri msg output eDP-1 on
    notify-send "Niri Monitor" "Enabled Laptop screen"
fi
