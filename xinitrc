#!/bin/sh

# ~/.xinitrc
#
# Executed by /usr/bin/startx to start a window manager.

if [ -f /usr/bin/i3 ]; then
    exec i3
fi
