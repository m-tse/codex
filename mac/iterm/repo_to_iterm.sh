#!/usr/bin/env bash
# Import iTerm2 preferences from this repo into the live macOS defaults store.
# Quit iTerm2 before running so it picks up the new settings on next launch.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/iterm.plist"

if [[ ! -f "$SRC" ]]; then
  echo "Missing $SRC" >&2
  exit 1
fi

if pgrep -xq iTerm2; then
  echo "iTerm2 is running. Quit it first (cmd-Q), then re-run." >&2
  exit 1
fi

TMP="$(mktemp -t iterm.plist)"
trap 'rm -f "$TMP"' EXIT
cp "$SRC" "$TMP"
plutil -convert binary1 "$TMP"
defaults import com.googlecode.iterm2 "$TMP"
killall cfprefsd 2>/dev/null || true
echo "Imported $SRC -> com.googlecode.iterm2"
