-- Hammerspoon utils - monitors
-- richa@avasthi.name
-- Utilities for generating and enforcing window/monitor layouts. Depends on:
--   * hs.geometry
--   * hs.screen

local geometry = require "hs.geometry"
local screen   = require "hs.screen"

local rpa          = rpa or {}
rpa.utils          = rpa.utils or {}
rpa.utils.monitors = {}


-- Find an individual screen by size
function rpa.utils.monitors.findScreen(w, h)
  return screen.find(geometry(nil, nil, w, h))
end


-- Return a west-to-east sorted list of all the screens. If multiple screens are at the same
-- east-west coordinate, the southernmost screen will be first.
function rpa.utils.monitors.screensWestToEast()
  local screens = screen.allScreens()

  table.sort(screens, function(screenA, screenB)
      local frameA = screenA:fullFrame()
      local frameB = screenB:fullFrame()

      if frameA.x == frameB.x then
        return frameA.y <= frameB.y
      else
        return frameA.x < frameB.x
      end
    end)

  return screens
end


return rpa.utils.monitors
