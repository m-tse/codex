# symlink i3 config to ~/.config/i3
# ln -s ~/Development/codex/debian/i3/.i3status.conf ~/.i3status.conf

`sudo apt-get install i3 i3lock i3status xss-lock numlockx`

To get i3 running on a Glinux machine, follow instructions at go/i3

Specifically, selecting the i3 option in the login screen is not enough,
you must modify your ~/.xsession file with the following
```
#!/bin/sh

# Necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=cinnamon  # gnome for trusty.

# NOTE: This may break your compose key.
# See http://g/i3-users/YBexXGbik7E for more details.
export GTK_IM_MODULE=xim

# Desktop background color.
xsetroot -solid "#333333"

## Uncomment if you use urxvt terminal emulator.
## Start urxvtd
#urxvtd -q -f -o
#export TERMINAL=urxvtc

# Comment out the following if this is .xsessionrc file,
# as opposed to .xsession. See https://wiki.debian.org/Xsession for details.
exec i3
```

Don't modify ~/.xsessionrc, as that will run always, and kick you out of
cinnamon if you want to switch back
