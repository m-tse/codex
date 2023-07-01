# Creates homedir symlinks to the files in this directory, allowing direct git tracking!
SCRIPT_DIR=$(dirname "$0")

ln -s $SCRIPT_DIR/.profile ~/.profile
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc
ln -s $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
# -h is required so we don't create ~/.submodules/.submodules
ln -hs $SCRIPT_DIR/.submodules ~/.submodules
