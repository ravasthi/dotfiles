local hotkey        = require "hs.hotkey"
local layout        = require "hs.layout"
local monitors      = require "rpa.utils.monitors"
local position      = require "rpa.utils.position"
local screen        = require "hs.screen"
local screenwatcher = require "hs.screen.watcher"
local window        = require "hs.window"


-- Startup options -------------------------------------------------------------


-- Functions -------------------------------------------------------------------
function smallCenter()
  window.moveToUnit(position.smallCenter())
end

function halfLeft()
  window.moveToUnit(position.halfLeft())
end

function halfRight()
  window.moveToUnit(position.halfRight())
end

function halfTop()
  window.moveToUnit(position.halfTop())
end

function halfBottom()
  window.moveToUnit(position.halfBottom())
end

function quarterTopLeft()
  window.moveToUnit(position.quarterTopLeft())
end

function quarterTopRight()
  window.moveToUnit(position.quarterTopRight())
end

function quarterBottomLeft()
  window.moveToUnit(position.quarterBottomLeft())
end

function quarterBottomRight()
  window.moveToUnit(position.quarterBottomRight())
end

function thirdLeft()
  window.moveToUnit(position.thirdLeft())
end

function thirdMiddle()
  window.moveToUnit(position.thirdMiddle())
end

function thirdRight()
  window.moveToUnit(position.thirdRight())
end

function twoThirdsLeft()
  window.moveToUnit(position.twoThirdsLeft())
end

function twoThirdsRight()
  window.moveToUnit(position.twoThirdsRight())
end

function fiveSixthsLeft()
  window.moveToUnit(position.fiveSixthsLeft())
end

function fiveSixthsRight()
  window.moveToUnit(position.fiveSixthsRight())
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
local laptopDimensions             = "1440x900"
local thunderboltDisplayDimensions = "2560x1440"
local tvDimensions                 = "1920x1080"

local layoutLaptopOnly = {
  -- Command line
  {"Terminal", nil, laptopDimensions, position.halfRight(), nil, nil},
  {"iTerm",    nil, laptopDimensions, position.halfRight(), nil, nil},

  -- Browsers
  {"Safari",        nil, laptopDimensions, layout.maximized, nil, nil},
  {"Google Chrome", nil, laptopDimensions, layout.maximized, nil, nil},
  {"Firefox",       nil, laptopDimensions, layout.maximized, nil, nil},
  {"WebKit",        nil, laptopDimensions, layout.maximized, nil, nil},

  -- Development
  {"TextMate",     nil, laptopDimensions, layout.maximized, nil, nil},
  {"Sublime Text", nil, laptopDimensions, layout.maximized, nil, nil},
  {"MacVim",       nil, laptopDimensions, layout.maximized, nil, nil},
  {"Atom",         nil, laptopDimensions, layout.maximized, nil, nil},
  {"CodeKit",      nil, laptopDimensions, layout.maximized, nil, nil},

  -- Productivity
  {"Calendar",    nil, laptopDimensions, layout.maximized, nil, nil},
  {"Fantastical", nil, laptopDimensions, layout.maximized, nil, nil},
  {"Mail",        nil, laptopDimensions, layout.maximized, nil, nil},
  {"Slack",       nil, laptopDimensions, layout.maximized, nil, nil},
  {"HipChat",     nil, laptopDimensions, layout.maximized, nil, nil},
  {"MindNode",    nil, laptopDimensions, layout.maximized, nil, nil},

  -- Music
  {"iTunes",  nil, laptopDimensions, layout.maximized, nil, nil},
  {"Rdio",    nil, laptopDimensions, layout.maximized, nil, nil},
  {"Spotify", nil, laptopDimensions, layout.maximized, nil, nil},

  -- Misc
  {"JIRA",     nil, laptopDimensions, layout.maximized,     nil, nil},
  {"Dash",     nil, laptopDimensions, layout.maximized,     nil, nil},
  {"Marked 2", nil, laptopDimensions, position.halfRight(), nil, nil},
  {"nvALT",    nil, laptopDimensions, position.halfRight(), nil, nil},
  {"Pocket",   nil, laptopDimensions, layout.maximized,     nil, nil},
  {"Reeder",   nil, laptopDimensions, layout.maximized,     nil, nil}
}

local layoutWithThunderboltDisplay = {
  -- Command line
  {"Terminal", nil, thunderboltDisplayDimensions, position.thirdRight(), nil, nil},
  {"iTerm",    nil, thunderboltDisplayDimensions, position.thirdRight(), nil, nil},

  -- Browsers
  {"Safari",        nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"Firefox",       nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"WebKit",        nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},

  -- Development
  {"TextMate",     nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"MacVim",       nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"Atom",         nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"CodeKit",      nil, thunderboltDisplayDimensions, position.thirdRight(),    nil, nil},

  -- Productivity
  {"Calendar",    nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"Fantastical", nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"Mail",        nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"Slack",       nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"HipChat",     nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"MindNode",    nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},

  -- Music
  {"iTunes",  nil, laptopDimensions, layout.maximized, nil, nil},
  {"Rdio",    nil, laptopDimensions, layout.maximized, nil, nil},
  {"Spotify", nil, laptopDimensions, layout.maximized, nil, nil},

  -- Misc
  {"JIRA",     nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"Dash",     nil, thunderboltDisplayDimensions, position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplayDimensions, position.thirdRight(),    nil, nil},
  {"nvALT",    nil, thunderboltDisplayDimensions, position.thirdRight(),    nil, nil},
  {"Pocket",   nil, laptopDimensions,             layout.maximized,         nil, nil},
  {"Reeder",   nil, laptopDimensions,             layout.maximized,         nil, nil}
}

local layoutWithTv = layoutLaptopOnly

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
    doLayoutLaptopOnly()
  else
    local thunderboltDisplay = screen.find(thunderboltDisplayDimensions)
    local tv                 = screen.find(tvDimensions)

    if #cinema_display > 0 then
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

