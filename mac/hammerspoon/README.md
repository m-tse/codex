# iTerm paste fix

Hammerspoon config that makes **Cmd+V** in iTerm2 paste a screenshot as a file
path instead of failing. When the clipboard contains an image, the script
saves it as a PNG to `/tmp/` and types the file path into
iTerm — Claude Code, Codex CLI, etc. then pick it up as an image attachment.
For text clipboards, Cmd+V behaves normally.

The system clipboard is never modified, so pasting screenshots into iMessage,
Slack, etc. continues to work as before.

## Setup

1. Install Hammerspoon:

   ```bash
   brew install --cask hammerspoon
   ```

2. Symlink this `init.lua` into `~/.hammerspoon/`:

   ```bash
   ln -s "$PWD/init.lua" ~/.hammerspoon/init.lua
   ```

3. Launch Hammerspoon (`open -a Hammerspoon`). It runs in the menu bar.

4. Grant **Accessibility** permission when prompted (System Settings →
   Privacy & Security → Accessibility → Hammerspoon ✅). Required to
   intercept Cmd+V and synthesize keystrokes.

5. Confirm: a brief `iTerm paste fix loaded` banner appears on load. If
   not, click the Hammerspoon menu bar icon → **Reload Config**.

## Usage

- Take a screenshot to clipboard: **Cmd+Shift+Ctrl+4** (region) or
  **Cmd+Shift+Ctrl+3** (full screen).
- Focus iTerm, press **Cmd+V**. The path to the saved PNG is typed in.
- In any other app, Cmd+V is untouched.
- In iTerm with a text clipboard, Cmd+V is also untouched.

## How it works

- `hs.eventtap` listens for keyDown events. Returns immediately for
  anything that isn't a clean Cmd+V (modifiers besides Cmd disqualify).
- Checks `frontmostApplication():bundleID()` against
  `com.googlecode.iterm2`. Other apps are ignored.
- Reads the pasteboard via `hs.pasteboard.readImage()`. If there's no
  image, the original Cmd+V flows through unchanged.
- If there is an image, writes it to `/tmp/screenshot-<ts>.png`
  types the path with `hs.eventtap.keyStrokes`, and swallows the original
  Cmd+V.

## Configuration

Edit constants at the top of `init.lua`:

- `ITERM_BUNDLE` — change or extend if you also want this in Ghostty,
  Alacritty, etc.
- `CACHE_DIR` — where saved PNGs live.

## Uninstall

```bash
rm ~/.hammerspoon/init.lua
brew uninstall --cask hammerspoon
```
