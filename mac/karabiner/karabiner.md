# Karabiner-Elements

## Why

macOS uses the Option key to produce special characters (e.g., Option+B types `∫`, Option+F types `ƒ`). The `DefaultKeyBinding.dict` file can remap Option+letter combos to emacs-style word navigation, but it only works in Cocoa text views (e.g., Chrome, TextEdit). Apps like iMessage, WhatsApp, and Electron apps ignore it entirely.

Karabiner-Elements intercepts key events at the keyboard driver level, so remappings work system-wide in all apps.

## Installation

```sh
brew install --cask karabiner-elements
```

## Configuration

Config lives at `~/.config/karabiner/karabiner.json`. Karabiner watches this file and applies changes automatically.

Use `karabiner_to_repo.sh` to snapshot the live config into this folder, and `repo_to_karabiner.sh` to push the repo copy back.

### Word navigation (emacs-style)

The complex modification rule "Option+B/F/D for word navigation" remaps:

| Shortcut | Action |
|---|---|
| Option+B | Move word backward |
| Option+F | Move word forward |
| Option+Shift+B | Select word backward |
| Option+Shift+F | Select word forward |
| Option+D | Delete word forward (GUI apps only — see below) |

These translate Option+letter into Option+Arrow (or Option+Delete), which macOS natively interprets as word navigation, bypassing the special character behavior.

### Terminal exception (iTerm2, Terminal, Ghostty)

Terminal emulators handle Option+letter combos themselves when the left/right Option key is set to **Esc+** in iTerm2 (Settings → Profiles → Keys → General). In that mode:

- Option+B sends `\e b` → readline `backward-word`
- Option+F sends `\e f` → readline `forward-word`
- Option+D sends `\e d` → readline `kill-word` (delete word forward)
- Option+Backspace sends `\e \x7f` → readline `backward-kill-word` (delete word backward)

Karabiner intercepting these and re-emitting them as `Option+Arrow` or `Option+Delete` breaks the readline handling. Symptoms: Option+Backspace produces `~3` (a truncated CSI escape sequence) in iTerm2, or deletes the whole line in Claude Code.

Fixes applied in this config:

1. **Option+Backspace sub-rule removed entirely.** It was a no-op remap (`Option+Backspace → Option+Backspace`) that only served to route the keystroke through Karabiner's event synthesizer, which corrupted it for terminals. Native macOS already handles Option+Backspace as delete-word-backward in every GUI text field, so no remap is needed.

2. **Option+D has a `frontmost_application_unless` condition** excluding iTerm2, Terminal, and Ghostty, so the native readline `\e d` sequence reaches the shell untouched.

Option+B and Option+F don't need the exception because `Option+Arrow` keys also work correctly in terminals with Esc+ mode — but if that ever changes, add the same conditions block to those two rules.

```json
"conditions": [
    {
        "type": "frontmost_application_unless",
        "bundle_identifiers": [
            "^com\\.googlecode\\.iterm2$",
            "^com\\.apple\\.Terminal$",
            "^com\\.mitchellh\\.ghostty$"
        ]
    }
]
```

### External keyboard swap

The config also swaps Command/Option on an external keyboard (vendor 65261, product 12384) so it matches the Mac keyboard layout.

### Function key remaps

F7/F8 are mapped to brightness, F10/F11/F12 to volume controls.
