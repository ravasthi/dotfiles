-- Hammerspoon utils - move
-- richa@avasthi.name
-- Functions to move and size windows.
local position = require "rpa.utils.position"
local window   = require "hs.window"

local rpa        = rpa or {}
rpa.utils        = rpa.utils or {}
rpa.utils.move = {}

function rpa.utils.move.maximize()
  local win = window.focusedWindow()
  win:maximize()
end

function rpa.utils.move.smallCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.smallCenter())
end

function rpa.utils.move.twoThirdsCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsCenter())
end

function rpa.utils.move.halfLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfLeft())
end

function rpa.utils.move.halfRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfRight())
end

function rpa.utils.move.halfWidthCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfWidthCenter())
end

function rpa.utils.move.halfTop()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfTop())
end

function rpa.utils.move.halfBottom()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfBottom())
end

function rpa.utils.move.quarterTopLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopLeft())
end

function rpa.utils.move.quarterTopRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopRight())
end

function rpa.utils.move.quarterBottomLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomLeft())
end

function rpa.utils.move.quarterBottomRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomRight())
end

function rpa.utils.move.thirdLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdLeft())
end

function rpa.utils.move.thirdCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdCenter())
end

function rpa.utils.move.thirdRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdRight())
end

function rpa.utils.move.twoThirdsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsLeft())
end

function rpa.utils.move.twoThirdsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsRight())
end

function rpa.utils.move.fiveSixthsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsLeft())
end

function rpa.utils.move.fiveSixthsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsRight())
end

function rpa.utils.move.pushUp()
  local win = window.focusedWindow()
  win:moveOneScreenNorth()
end

function rpa.utils.move.pushRight()
  local win = window.focusedWindow()
  win:moveOneScreenEast()
end

function rpa.utils.move.pushDown()
  local win = window.focusedWindow()
  win:moveOneScreenSouth()
end

function rpa.utils.move.pushLeft()
  local win = window.focusedWindow()
  win:moveOneScreenWest()
end

return rpa.utils.move
