# Creates homedir symlinks to the files in this directory, allowing direct git tracking!
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -s $SCRIPT_DIR/.profile ~/.profile
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc
ln -s $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
ln -s $SCRIPT_DIR/.submodules ~/.submodules
# Put any local settings into this file
touch ~/.local_profile
