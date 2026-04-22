#!/usr/bin/env bash
# Copies the on-disk Karabiner-Elements config to the repo version.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$HOME/.config/karabiner/karabiner.json"
DEST="$SCRIPT_DIR/karabiner.json"

if [[ ! -f "$SRC" ]]; then
  echo "Missing $SRC" >&2
  exit 1
fi

cp "$SRC" "$DEST"
echo "Exported Karabiner config -> $DEST"
