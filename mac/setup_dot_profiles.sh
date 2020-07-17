#!/bin/bash

ln -s ~/Development/codex/posix/.tmux.conf ~/.tmux.conf 2>/dev/null
ln -s ~/Development/codex/posix/.vimrc ~/.vimrc 2>/dev/null

FILE=~/.zshrc
touch $FILE
LINE='source ~/Development/codex/posix/.zshrc'
grep -xqF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
LINE='source ~/Development/codex/posix/.profile'
grep -xqF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
LINE='source ~/Development/codex/mac/.mac_profile'
grep -xqF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
