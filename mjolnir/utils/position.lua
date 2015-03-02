-- Mjolnir utils - position
-- richa@avasthi.name
-- Utilities for setting positions of windows. Depends on:
--   * grid extension

local grid   = require "mjolnir.bg.grid"
local window = require "mjolnir.window"

rpa.utils          = rpa.utils or {}
rpa.utils.position = {}

grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 4
grid.MARGINX    = 0
grid.MARGINY    = 0

function rpa.utils.position.set_position(frame, not_on_grid)
  local win = window.focusedwindow()
  if not_on_grid == true
    win:setframe(frame)
  else
    grid.set(win, frame, win:screen())
  end
end

function rpa.utils.position.small_center()
  local win = window.focusedwindow()
  local frame = win:screen():frame()
  return {
    w = frame.w / 2,
    h = frame.h / 2,
    x = frame.x + frame.w / 4,
    y = frame.y + frame.h / 4
  }
end

function rpa.utils.position.halfleft()
  return {
    x = 0,
    y = 0,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.halfright()
  return {
    x = grid.GRIDWIDTH / 2,
    y = 0,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.halftop()
  return {
    x = 0,
    y = 0,
    w = grid.GRIDWIDTH,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.halfbottom()
  return {
    x = 0,
    y = grid.GRIDHEIGHT / 2,
    w = grid.GRIDWIDTH,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.quartertopleft()
  return {
    x = 0,
    y = 0,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.quartertopright()
  return {
    x = grid.GRIDWIDTH / 2,
    y = 0,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.quarterbottomleft()
  return {
    x = 0,
    y = grid.GRIDHEIGHT / 2,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.quarterbottomright()
  return {
    x = grid.GRIDWIDTH / 2,
    y = grid.GRIDHEIGHT / 2,
    w = grid.GRIDWIDTH / 2,
    h = grid.GRIDHEIGHT / 2
  }
end

function rpa.utils.position.thirdleft()
  return {
    x = 0,
    y = 0,
    w = grid.GRIDWIDTH / 3,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.thirdmiddle()
  return {
    x = grid.GRIDWIDTH / 3,
    y = 0,
    w = grid.GRIDWIDTH / 3,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.thirdright()
  return {
    x = 2 * grid.GRIDWIDTH / 3,
    y = 0,
    w = grid.GRIDWIDTH / 3,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.twothirdsleft()
  return {
    x = 0,
    y = 0,
    w = 2 * grid.GRIDWIDTH / 3,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.twothirdsright()
  return {
    x = grid.GRIDWIDTH / 3,
    y = 0,
    w = 2 * grid.GRIDWIDTH / 3,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.fivesixthsleft()
  return {
    x = 0,
    y = 0,
    w = 5 * grid.GRIDWIDTH / 6,
    h = grid.GRIDHEIGHT
  }
end

function rpa.utils.position.fivesixthsright()
  return {
    x = grid.GRIDWIDTH / 6,
    y = 0,
    w = 5 * grid.GRIDWIDTH / 6,
    h = grid.GRIDHEIGHT
  }
end
