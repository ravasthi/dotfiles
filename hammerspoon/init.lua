local alert         = require "hs.alert"
local hotkey        = require "hs.hotkey"
local layouts       = require "rpa.utils.layouts"
local monitors      = require "rpa.utils.monitors"
local move          = require "rpa.utils.move"
local pathwatcher   = require "hs.pathwatcher"
local screen        = require "hs.screen"
local screenwatcher = require "hs.screen.watcher"
local window        = require "hs.window"


-- Startup options -------------------------------------------------------------


-- Functions -------------------------------------------------------------------
----- Misc ---------------------------------------------------------------------
function showConsole()
  hs.openConsole(true)
end

function reloadConfig()
  hs.reload()
  alert.show("Hammerspoon config reloaded.")
end


----- Reload config automatically ----------------------------------------------
function reloadConfigAuto(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
        alert.show("Hammerspoon config automatically reloaded.")
    end
end

pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfigAuto):start()


----- Handle screen changes ----------------------------------------------------
function handleScreenChanges()
  local screens = monitors.screensWestToEast()

  if #screens == 1 then
    local frame = screens[1]:fullFrame()

    if frame.w == 2560 and frame.h == 1440 then
      layouts.doLayoutImac()
    else
      layouts.doLayoutLaptopOnly()
    end
  elseif #screens == 2 then
    if thunderboltDisplays then
      layouts.doLayoutWithThunderboltDisplay()
    elseif monitor4k and monitor4k:name() == 'LG HDR 4K' then
      layouts.doLayoutWith4kDisplay()
    elseif tv then
      layouts.doLayoutWithTv()
    end
  elseif #screens == 3 then
    layouts.doLayoutWithTwoThunderboltDisplays()
  else
    -- For other, unrecognized screens, leave all windows on main laptop screen
    layouts.doLayoutLaptopOnly()
  end
end

screenwatcher.new(handleScreenChanges):start()


-- Key bindings ----------------------------------------------------------------
hotkey.bind({"ctrl"},                 "1",     nil, move.maximize)
hotkey.bind({"ctrl", "shift"},        "1",     nil, move.smallCenter)
hotkey.bind({"ctrl", "shift", "alt"}, "1",     nil, move.twoThirdsCenter)
hotkey.bind({"ctrl"},                 "2",     nil, move.halfLeft)
hotkey.bind({"ctrl", "shift"},        "2",     nil, move.halfRight)
hotkey.bind({"ctrl"},                 "3",     nil, move.halfTop)
hotkey.bind({"ctrl", "shift"},        "3",     nil, move.halfBottom)
hotkey.bind({"ctrl"},                 "4",     nil, move.thirdLeft)
hotkey.bind({"ctrl", "shift"},        "4",     nil, move.thirdRight)
hotkey.bind({"ctrl", "shift", "alt"}, "4",     nil, move.thirdMiddle)
hotkey.bind({"ctrl"},                 "5",     nil, move.twoThirdsLeft)
hotkey.bind({"ctrl", "shift"},        "5",     nil, move.twoThirdsRight)
hotkey.bind({"ctrl"},                 "6",     nil, move.fiveSixthsLeft)
hotkey.bind({"ctrl", "shift"},        "6",     nil, move.fiveSixthsRight)
hotkey.bind({"ctrl"},                 "7",     nil, move.quarterTopLeft)
hotkey.bind({"ctrl", "shift"},        "7",     nil, move.quarterBottomLeft)
hotkey.bind({"ctrl"},                 "8",     nil, move.quarterTopRight)
hotkey.bind({"ctrl", "shift"},        "8",     nil, move.quarterBottomRight)
hotkey.bind({"cmd", "alt"},           "up",    nil, move.pushUp)
hotkey.bind({"cmd", "alt"},           "right", nil, move.pushRight)
hotkey.bind({"cmd", "alt"},           "down",  nil, move.pushDown)
hotkey.bind({"cmd", "alt"},           "left",  nil, move.pushLeft)
hotkey.bind({"ctrl", "shift"},        "\\",    nil, layouts.doLayoutLaptopOnly)
hotkey.bind({"ctrl", "shift", "alt"}, "\\",    nil, layouts.doLayoutWith4kDisplay)
hotkey.bind({"ctrl", "alt"},          "\\",    nil, layouts.doLayoutWithTwoThunderboltDisplays)
hotkey.bind({"ctrl"},                 "\\",    nil, layouts.doLayoutWithThunderboltDisplay)
hotkey.bind({"ctrl"},                 "/",     nil, layouts.doLayoutWithTv)
hotkey.bind({"ctrl", "shift"},        "/",     nil, layouts.doLayoutImac)
hotkey.bind({"cmd", "ctrl", "shift"}, "l",     nil, showConsole)
hotkey.bind({"cmd", "ctrl", "shift"}, "r",     nil, reloadConfig)
