# Link this git tracked keybindings.json and user_settings to the location used by vs code
# for easier git updates.
rm ~/Library/Application\ Support/Code/User/keybindings.json
sudo ln -s ~/Development/codex/mac/vscode/keybindings.json /Users/m/Library/Application\ Support/Code/User/keybindings.json

rm ~/Library/Application\ Support/Code/User/settings.json
sudo ln -s ~/Development/codex/mac/vscode/settings.json /Users/m/Library/Application\ Support/Code/User/settings.json
