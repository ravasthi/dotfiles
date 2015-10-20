local alert         = require "hs.alert"
local hotkey        = require "hs.hotkey"
local layout        = require "hs.layout"
local monitors      = require "rpa.utils.monitors"
local position      = require "rpa.utils.position"
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


----- Window manipulation ------------------------------------------------------
function maximize()
  local win = window.focusedWindow()
  win:maximize()
end

function smallCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.smallCenter())
end

function halfLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfLeft())
end

function halfRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfRight())
end

function halfTop()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfTop())
end

function halfBottom()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfBottom())
end

function quarterTopLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopLeft())
end

function quarterTopRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopRight())
end

function quarterBottomLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomLeft())
end

function quarterBottomRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomRight())
end

function thirdLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdLeft())
end

function thirdMiddle()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdMiddle())
end

function thirdRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdRight())
end

function twoThirdsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsLeft())
end

function twoThirdsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsRight())
end

function fiveSixthsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsLeft())
end

function fiveSixthsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsRight())
end

function pushUp()
  local win = window.focusedWindow()
  win:moveOneScreenNorth()
end

function pushRight()
  local win = window.focusedWindow()
  win:moveOneScreenEast()
end

function pushDown()
  local win = window.focusedWindow()
  win:moveOneScreenSouth()
end

function pushLeft()
  local win = window.focusedWindow()
  win:moveOneScreenWest()
end

-- Screen layouts --------------------------------------------------------------
local laptop             = function() return monitors.findScreen(1440, 900) end
local thunderboltDisplay = function() return monitors.findScreen(2560, 1440) end
local tv                 = function() return monitors.findScreen(1920, 1080) end
local iMac               = function() return monitors.findScreen(2560, 1440) end

local layoutImac = {
  -- Command line
  {"Terminal", nil, iMac, position.thirdRight(), nil, nil},
  {"iTerm",    nil, iMac, position.thirdRight(), nil, nil},

  -- Browsers
  {"Safari",        nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Firefox",       nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"WebKit",        nil, iMac, position.twoThirdsLeft(), nil, nil},

  -- Development
  {"TextMate",     nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"MacVim",       nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Atom",         nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"CodeKit",      nil, iMac, position.thirdRight(),    nil, nil},

  -- Productivity
  {"Calendar",    nil, iMac, position.smallCenter(),   nil, nil},
  {"Fantastical", nil, iMac, position.smallCenter(),   nil, nil},
  {"Mail",        nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Slack",       nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"HipChat",     nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"MindNode",    nil, iMac, position.twoThirdsLeft(), nil, nil},

  -- Music
  {"iTunes",  nil, iMac, position.smallCenter(), nil, nil},
  {"Rdio",    nil, iMac, position.smallCenter(), nil, nil},
  {"Spotify", nil, iMac, position.smallCenter(), nil, nil},

  -- Misc
  {"Dash",     nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, iMac, position.thirdRight(),    nil, nil},
  {"nvALT",    nil, iMac, position.thirdRight(),    nil, nil},
  {"JIRA",     nil, iMac, position.smallCenter(),   nil, nil},
  {"Pocket",   nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Reeder",   nil, iMac, position.twoThirdsLeft(), nil, nil}
}

local layoutLaptopOnly = {
  -- Command line
  {"Terminal", nil, laptop, position.halfRight(), nil, nil},
  {"iTerm",    nil, laptop, position.halfRight(), nil, nil},

  -- Browsers
  {"Safari",        nil, laptop, layout.maximized, nil, nil},
  {"Google Chrome", nil, laptop, layout.maximized, nil, nil},
  {"Firefox",       nil, laptop, layout.maximized, nil, nil},
  {"WebKit",        nil, laptop, layout.maximized, nil, nil},

  -- Development
  {"TextMate",     nil, laptop, layout.maximized, nil, nil},
  {"Sublime Text", nil, laptop, layout.maximized, nil, nil},
  {"MacVim",       nil, laptop, layout.maximized, nil, nil},
  {"Atom",         nil, laptop, layout.maximized, nil, nil},
  {"CodeKit",      nil, laptop, layout.maximized, nil, nil},

  -- Productivity
  {"Calendar",    nil, laptop, layout.maximized, nil, nil},
  {"Fantastical", nil, laptop, layout.maximized, nil, nil},
  {"Mail",        nil, laptop, layout.maximized, nil, nil},
  {"Slack",       nil, laptop, layout.maximized, nil, nil},
  {"HipChat",     nil, laptop, layout.maximized, nil, nil},
  {"MindNode",    nil, laptop, layout.maximized, nil, nil},

  -- Music
  {"iTunes",  nil, laptop, layout.maximized, nil, nil},
  {"Rdio",    nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},

  -- Misc
  {"Dash",     nil, laptop, layout.maximized,     nil, nil},
  {"Marked 2", nil, laptop, position.halfRight(), nil, nil},
  {"nvALT",    nil, laptop, position.halfRight(), nil, nil},
  {"JIRA",     nil, laptop, layout.maximized,     nil, nil},
  {"Pocket",   nil, laptop, layout.maximized,     nil, nil},
  {"Reeder",   nil, laptop, layout.maximized,     nil, nil}
}

local layoutWithThunderboltDisplay = {
  -- Command line
  {"Terminal", nil, thunderboltDisplay, position.thirdRight(), nil, nil},
  {"iTerm",    nil, thunderboltDisplay, position.thirdRight(), nil, nil},

  -- Browsers
  {"Safari",        nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"Firefox",       nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"WebKit",        nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},

  -- Development
  {"TextMate",     nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"MacVim",       nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"Atom",         nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"CodeKit",      nil, thunderboltDisplay, position.thirdRight(),    nil, nil},

  -- Productivity
  {"Calendar",    nil, laptop,             layout.maximized,         nil, nil},
  {"Fantastical", nil, laptop,             layout.maximized,         nil, nil},
  {"Mail",        nil, laptop,             layout.maximized,         nil, nil},
  {"Slack",       nil, laptop,             layout.maximized,         nil, nil},
  {"HipChat",     nil, laptop,             layout.maximized,         nil, nil},
  {"MindNode",    nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},

  -- Music
  {"iTunes",  nil, laptop, layout.maximized, nil, nil},
  {"Rdio",    nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},

  -- Misc
  {"Dash",     nil, thunderboltDisplay, position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplay, position.thirdRight(),    nil, nil},
  {"nvALT",    nil, thunderboltDisplay, position.thirdRight(),    nil, nil},
  {"JIRA",     nil, laptop,             layout.maximized,         nil, nil},
  {"Pocket",   nil, laptop,             layout.maximized,         nil, nil},
  {"Reeder",   nil, laptop,             layout.maximized,         nil, nil}
}

local layoutWithTv = layoutLaptopOnly

function doLayoutImac()
  layout.apply(layoutImac)
end

function doLayoutLaptopOnly()
  layout.apply(layoutLaptopOnly)
end

function doLayoutWithThunderboltDisplay()
  layout.apply(layoutWithThunderboltDisplay)
end

function doLayoutWithTv()
  layout.apply(layoutWithTv)
end

function handleScreenChanges()
  local screens = monitors.screensWestToEast()

  if #screens == 1 then
    local frame = screens[1]:fullFrame()

    if frame.w == 2560 and frame.h == 1440 then
      doLayoutImac()
    else
      doLayoutLaptopOnly()
    end
  else
    if #thunderboltDisplay > 0 then
      doLayoutWithThunderboltDisplay()
    elseif #tv > 0 then
      doLayoutWithTv()
    else
      -- For other, unrecognized screens, leave all windows on main laptop screen
      doLayoutLaptopOnly()
    end
  end
end

screenwatcher.new(handleScreenChanges):start()


-- Key bindings ----------------------------------------------------------------
hotkey.bind({"ctrl"},                 "1",     nil, maximize)
hotkey.bind({"ctrl", "shift"},        "1",     nil, smallCenter)
hotkey.bind({"ctrl"},                 "2",     nil, halfLeft)
hotkey.bind({"ctrl", "shift"},        "2",     nil, halfRight)
hotkey.bind({"ctrl"},                 "3",     nil, halfTop)
hotkey.bind({"ctrl", "shift"},        "3",     nil, halfBottom)
hotkey.bind({"ctrl"},                 "4",     nil, thirdLeft)
hotkey.bind({"ctrl", "shift"},        "4",     nil, thirdRight)
hotkey.bind({"ctrl", "shift", "alt"}, "4",     nil, thirdMiddle)
hotkey.bind({"ctrl"},                 "5",     nil, twoThirdsLeft)
hotkey.bind({"ctrl", "shift"},        "5",     nil, twoThirdsRight)
hotkey.bind({"ctrl"},                 "6",     nil, fiveSixthsLeft)
hotkey.bind({"ctrl", "shift"},        "6",     nil, fiveSixthsRight)
hotkey.bind({"ctrl"},                 "7",     nil, quarterTopLeft)
hotkey.bind({"ctrl", "shift"},        "7",     nil, quarterBottomLeft)
hotkey.bind({"ctrl"},                 "8",     nil, quarterTopRight)
hotkey.bind({"ctrl", "shift"},        "8",     nil, quarterBottomRight)
hotkey.bind({"cmd", "alt"},           "up",    nil, pushUp)
hotkey.bind({"cmd", "alt"},           "right", nil, pushRight)
hotkey.bind({"cmd", "alt"},           "down",  nil, pushDown)
hotkey.bind({"cmd", "alt"},           "left",  nil, pushLeft)
hotkey.bind({"ctrl", "shift"},        "\\",    nil, doLayoutLaptopOnly)
hotkey.bind({"ctrl"},                 "\\",    nil, doLayoutWithThunderboltDisplay)
hotkey.bind({"ctrl"},                 "/",     nil, doLayoutWithTv)
hotkey.bind({"ctrl", "shift"},        "/",     nil, doLayoutImac)
hotkey.bind({"cmd", "ctrl", "shift"}, "l",     nil, showConsole)
hotkey.bind({"cmd", "ctrl", "shift"}, "r",     nil, reloadConfig)

