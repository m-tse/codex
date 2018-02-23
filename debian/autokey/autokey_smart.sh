#!/bin/bash

# Useful for i3, which auto-reloads all the time

ps aux | pgrep autokey-gtk

if [ $? -ne 0 ]; then
  autokey-gtk
fi
