# Setting up Autokey

`sudo apt-get install autokey-gtk`

# link autokey_phrases to ~/.config/autokey/data/My Phrases
```
rm -rf ~/.config/autokey/data/My\ Phrases/
ln -s ~/Development/codex/debian/autokey/autokey_phrases/ ~/.config/autokey/data/autokey_phrases
```
