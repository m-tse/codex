#!/usr/bin/env bash
# Copies the repo Karabiner-Elements config to the disk location.
# Karabiner watches the file and applies changes automatically.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/karabiner.json"
DEST="$HOME/.config/karabiner/karabiner.json"

if [[ ! -f "$SRC" ]]; then
  echo "Missing $SRC" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
cp "$SRC" "$DEST"
echo "Imported $SRC -> $DEST"
