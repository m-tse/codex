# Set DPI to 2x
gsettings set org.gnome.desktop.interface scaling-factor 2
# Set scale to compensate for 2x DPI, and then set panning so mouse can expand across the screen
# 2x2 doesn't work b/c nvidia... https://askubuntu.com/questions/704503/scale-2x2-in-xrandr-causes-the-monitor-to-not-display-anything
xrandr --output DP-1 --scale 1x1 --output HDMI-0 --right-of DP-1 --scale 2x2.001
# Set key repeat speed
xset r rate 250 40

# Must be last?
autokey-gtk

