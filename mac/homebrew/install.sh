# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew cask install visual-studio-code
brew cask install google-backup-and-sync
# To get window management keyboard shortcuts
brew cask install rectangle
# To get F11/F12 volume adjustment
brew cask install karabiner-elements
# To get mouse 4/5 to behave as back/forward
brew cask install sensiblesidebuttons

# Command line tools
brew install bat # Fancy cat with syntax highlighting and line numbers
brew install diff-so-fancy # Fancy git diff
brew install tree # View directory tree structure
brew install fd # Fancy fast find
