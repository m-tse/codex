#!/bin/bash

ps aux | pgrep autokey-gtk

if [ $? -ne 0 ]; then
  autokey-gtk
fi

