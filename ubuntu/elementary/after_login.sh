# Set DPI to 2x
gsettings set org.gnome.desktop.interface scaling-factor 2
# Set scale to compensate for 2x DPI, and then set panning so mouse can expand across the screen
xrandr --output HDMI-1 --scale 2x2 --panning 3840x2160+3840+0

# Set key repeat speed
xset r rate 250 40

# Must be last?
autokey-gtk

