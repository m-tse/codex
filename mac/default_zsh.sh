# Make zsh the default shell. This isn't in configure.sh because it requires a password prompt, so
# it's more brittle than the others
chsh -s /bin/zsh
