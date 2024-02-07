# Non-brittle settings to set from the command line to configure macOS.

###################
# Keyboard Settings
###################

# Disabling press-and-hold for special keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat settings
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

#################
# Finder Settings
#################

# Show dotfiles in Finder by default. I don't do this anymore, because
# I only ever use dotfiles when in the terminal. When I'm clicking around
# in the finder, I'm not going to click on one of those. So this just creates
# extra bloat when navigating the finder.
# defaults write com.apple.finder AppleShowAllFiles TRUE

# Show all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show the path bar on the bottom of finder. It's sorta redundant with the window title path, but it allows
# quick navigation to parent directories.
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use smallest possible icons on left hand side.
defaults write -g NSTableViewDefaultSizeMode -int 1

###############
# Dock settings
###############

# Set Dock to auto-hide
defaults write com.apple.dock autohide -bool true
# Remove any delay to begin the autohide or autoshow
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation for autohide/show
defaults write com.apple.dock autohide-time-modifier -int 0
# Need to call this to reset the settings above
killall Dock

# Disable show recent apps in dock
defaults write com.apple.dock show-recents -bool false

# Stop spaces from auto-rearranging based on most recent use.
defaults write com.apple.dock mru-spaces -bool false

# Disable dock bouncing on notification
defaults write com.apple.dock no-bouncing -bool TRUE

#####################
# Screenshot settings
#####################

# Set screenshots location to ~/Downloads/"
defaults write com.apple.screencapture location ~/Downloads/

# Set default screenshot basename
defaults write com.apple.screencapture name "screenshot"

# Disable shadow in screenshot
defaults write com.apple.screencapture disable-shadow -bool true

###################
# Language Settings
###################

# Disables the random popup above the typing cursor, that indicates which language we're in.
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
