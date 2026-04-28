#!/usr/bin/env bash

# 1. Kiểm tra màn hình rời
if ! niri msg outputs | grep -q "HDMI-A-1"; then
    niri msg action output-set-enabled eDP-1 on
    notify-send "Niri" "External monitor not found!"
    exit 1
fi

# 2. Kiểm tra trạng thái hiện tại của eDP-1
# Niri sẽ báo 'Logical size' nếu màn hình đang được enable
if niri msg outputs | grep -A 10 'eDP-1' | grep -q 'Logical size'; then
    # Sử dụng output-set-enabled off để gỡ bỏ hoàn toàn màn hình khỏi layout
    niri msg action output-set-enabled eDP-1 off
    notify-send "Niri" "Disabled Laptop screen"
else
    # Bật lại màn hình laptop
    niri msg action output-set-enabled eDP-1 on
    notify-send "Niri" "Enabled Laptop screen"
fi
