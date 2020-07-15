# Add meta key shortcuts os-wide
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p ~/Library/KeyBindings
ln -s $DIR/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
