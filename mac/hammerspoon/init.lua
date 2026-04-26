-- Cmd+V in iTerm: if clipboard has an image, save it as PNG and type the file
-- path; otherwise pass the Cmd+V through unchanged. Touches no other apps.

local ITERM_BUNDLE = "com.googlecode.iterm2"
local CACHE_DIR = os.getenv("HOME") .. "/.cache/iterm-paste-fix"
local MAX_AGE_DAYS = 7
hs.fs.mkdir(CACHE_DIR)

local function sweepOldClips()
    local cutoff = os.time() - (MAX_AGE_DAYS * 86400)
    local removed = 0
    for file in hs.fs.dir(CACHE_DIR) do
        if file:match("^clip%-.+%.png$") then
            local path = CACHE_DIR .. "/" .. file
            local attrs = hs.fs.attributes(path)
            if attrs and attrs.modification < cutoff then
                if os.remove(path) then removed = removed + 1 end
            end
        end
    end
    return removed
end

local swept = sweepOldClips()

local cmdV = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    local flags = event:getFlags()
    local isCmdV = event:getKeyCode() == hs.keycodes.map["v"]
        and flags.cmd and not flags.alt and not flags.ctrl and not flags.shift

    if not isCmdV then return false end

    local app = hs.application.frontmostApplication()
    if not app or app:bundleID() ~= ITERM_BUNDLE then return false end

    local image = hs.pasteboard.readImage()
    if not image then return false end

    local path = string.format("%s/clip-%s.png", CACHE_DIR, os.date("%Y%m%d-%H%M%S"))
    if not image:saveToFile(path) then return false end

    hs.eventtap.keyStrokes(path)
    return true  -- swallow the original Cmd+V
end)

cmdV:start()

hs.alert.show(string.format("iTerm paste fix loaded (swept %d)", swept))
