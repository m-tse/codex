#!/bin/bash
# useful for i3, which reloads all the time

ps aux | pgrep autokey-gtk

if [ $? -ne 0 ]; then
  autokey-gtk
fi
