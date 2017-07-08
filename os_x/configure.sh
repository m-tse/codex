DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Disabling press-and-hold for special keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show dotfiles in Finder by default
defaults write com.apple.finder AppleShowAllFiles TRUE

# Show all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set Dock to auto-hide and remove the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# Prevent Time Machine from prompting to use new hard drives as backup volume?
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Set screenshots location to ~/Downloads/"
defaults write com.apple.screencapture location ~/Downloads/

# Set meta key shortcuts
mkdir -p ~/Library/KeyBindings
ln -s $DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/

# Set key repeat settings
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Disable dock bouncing on notification
defaults write com.apple.dock no-bouncing -bool TRUE
