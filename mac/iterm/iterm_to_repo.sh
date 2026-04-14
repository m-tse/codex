#!/usr/bin/env bash
# Export iTerm2 preferences from the live macOS defaults store into this repo.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$SCRIPT_DIR/iterm.plist"

defaults export com.googlecode.iterm2 "$DEST"
plutil -convert xml1 "$DEST"
echo "Exported iTerm2 prefs (XML) -> $DEST"
