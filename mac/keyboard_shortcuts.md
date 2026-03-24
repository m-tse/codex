# Keyboard Shortcuts (hidutil)

## Why

We use function keys as actual F1-F12 (enabled in System Settings > Keyboard > "Use F1, F2, etc. keys as standard function keys"). This lets us bind F1-F5 to switch between macOS Desktops/Spaces via System Settings > Keyboard > Keyboard Shortcuts > Mission Control (e.g. F1 = Desktop 1, F2 = Desktop 2, etc.).

The problem is that with standard function keys enabled, we lose the media key behavior (volume, brightness). macOS Keyboard Shortcuts doesn't support remapping keys to volume/brightness controls, and we don't want to install third-party software (Karabiner, etc.) just for this.

The solution: use `hidutil` to remap a few unused function keys to volume and brightness controls. This is a built-in macOS tool that requires no extra software.

## What

Remaps function keys on the **built-in MacBook keyboard only** (external keyboards unaffected).

## Mappings

| Key | Action            | Src (HID)      | Dst (HID)      |
|-----|-------------------|----------------|----------------|
| F7  | Brightness Down   | 0x700000040    | 0xC00000070    |
| F8  | Brightness Up     | 0x700000041    | 0xC0000006F    |
| F11 | Volume Down       | 0x700000044    | 0xC000000EA    |
| F12 | Volume Up         | 0x700000045    | 0xC000000E9    |

> Note: This assumes "Function keys" mode is enabled in System Settings (F1-F12 behave as standard function keys, not media keys).

## Apply immediately

```bash
hidutil property --matching '{"Product": "Apple Internal Keyboard / Trackpad"}' --set '{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc": 0x700000044, "HIDKeyboardModifierMappingDst": 0xC000000EA}, {"HIDKeyboardModifierMappingSrc": 0x700000045, "HIDKeyboardModifierMappingDst": 0xC000000E9}, {"HIDKeyboardModifierMappingSrc": 0x700000040, "HIDKeyboardModifierMappingDst": 0xC00000070}, {"HIDKeyboardModifierMappingSrc": 0x700000041, "HIDKeyboardModifierMappingDst": 0xC0000006F}]}'
```

## Persist across reboots

Create `~/Library/LaunchAgents/com.local.hidutil-remap.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.local.hidutil-remap</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/bin/hidutil</string>
    <string>property</string>
    <string>--matching</string>
    <string>{"Product": "Apple Internal Keyboard / Trackpad"}</string>
    <string>--set</string>
    <string>{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc": 0x700000044, "HIDKeyboardModifierMappingDst": 0xC000000EA}, {"HIDKeyboardModifierMappingSrc": 0x700000045, "HIDKeyboardModifierMappingDst": 0xC000000E9}, {"HIDKeyboardModifierMappingSrc": 0x700000040, "HIDKeyboardModifierMappingDst": 0xC00000070}, {"HIDKeyboardModifierMappingSrc": 0x700000041, "HIDKeyboardModifierMappingDst": 0xC0000006F}]}</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

Then load it:

```bash
launchctl load ~/Library/LaunchAgents/com.local.hidutil-remap.plist
```

## Remove

```bash
launchctl unload ~/Library/LaunchAgents/com.local.hidutil-remap.plist
rm ~/Library/LaunchAgents/com.local.hidutil-remap.plist
```
