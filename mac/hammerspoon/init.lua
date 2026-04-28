-- Cmd+V in iTerm: if clipboard has an image, save it as PNG and type the file
-- path; otherwise pass the Cmd+V through unchanged. Touches no other apps.

local ITERM_BUNDLE = "com.googlecode.iterm2"
local CACHE_DIR = "/tmp"

local cmdV = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    local flags = event:getFlags()
    local isCmdV = event:getKeyCode() == hs.keycodes.map["v"]
        and flags.cmd and not flags.alt and not flags.ctrl and not flags.shift

    if not isCmdV then return false end

    local app = hs.application.frontmostApplication()
    if not app or app:bundleID() ~= ITERM_BUNDLE then return false end

    local image = hs.pasteboard.readImage()
    if not image then return false end

    -- Defer file I/O and keystroke synthesis: the eventtap callback must return
    -- quickly or macOS disables the tap.
    hs.timer.doAfter(0, function()
        local path = string.format("%s/screenshot-%s.png", CACHE_DIR, os.date("%Y%m%d-%H%M%S"))
        if image:saveToFile(path) then
            hs.eventtap.keyStrokes(path)
        end
    end)
    return true  -- swallow the original Cmd+V
end)

cmdV:start()

-- macOS occasionally disables eventtaps; re-enable on a timer.
hs.timer.doEvery(30, function()
    if not cmdV:isEnabled() then
        cmdV:stop()
        cmdV:start()
    end
end)

hs.alert.show("iTerm paste fix loaded")
