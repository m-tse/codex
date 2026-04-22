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

### Word navigation (emacs-style)

The complex modification rule "Option+B/F/D/H/Backspace for word navigation" remaps:

| Shortcut | Action |
|---|---|
| Option+B | Move word backward |
| Option+F | Move word forward |
| Option+Shift+B | Select word backward |
| Option+Shift+F | Select word forward |
| Option+D | Delete word forward |
| Option+H | Delete word backward |
| Option+Backspace | Delete word backward |
```
{
    "description": "Option+B/F/D/H/Backspace for word navigation (emacs-style)",
    "manipulators": [
        {
            "description": "Option+B → Option+Left (word backward)",
            "from": {
                "key_code": "b",
                "modifiers": {
                    "mandatory": ["option"],
                    "optional": ["shift"]
                }
            },
            "to": [
                {
                    "key_code": "left_arrow",
                    "modifiers": ["option"]
                }
            ],
            "type": "basic"
        },
        {
            "description": "Option+F → Option+Right (word forward)",
            "from": {
                "key_code": "f",
                "modifiers": {
                    "mandatory": ["option"],
                    "optional": ["shift"]
                }
            },
            "to": [
                {
                    "key_code": "right_arrow",
                    "modifiers": ["option"]
                }
            ],
            "type": "basic"
        },
        {
            "description": "Option+D → Option+Delete (delete word forward)",
            "from": {
                "key_code": "d",
                "modifiers": { "mandatory": ["option"] }
            },
            "to": [
                {
                    "key_code": "delete_forward",
                    "modifiers": ["option"]
                }
            ],
            "type": "basic"
        },
        {
            "description": "Option+Backspace → Option+Backspace (delete word backward)",
            "from": {
                "key_code": "delete_or_backspace",
                "modifiers": { "mandatory": ["option"] }
            },
            "to": [
                {
                    "key_code": "delete_or_backspace",
                    "modifiers": ["option"]
                }
            ],
            "type": "basic"
        }
    ]
}
```

These translate Option+letter into Option+Arrow (which macOS natively interprets as word navigation), bypassing the special character behavior.

### External keyboard swap

The config also swaps Command/Option on an external keyboard (vendor 65261, product 12384) so it matches the Mac keyboard layout.

### Function key remaps

F7/F8 are mapped to brightness, F10/F11/F12 to volume controls.
