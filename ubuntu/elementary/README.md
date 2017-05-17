To stop elementary from randomly crashing during Chrome usage:

sudo vim /etc/default/grub

Change GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" 
to GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_idle.max_cstate=1"

sudo update-grub
sudo reboot
