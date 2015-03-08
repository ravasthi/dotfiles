-- Mjolnir utils - monitors
-- richa@avasthi.name
-- Utilities for generating and enforcing window/monitor layouts. Depends on:
--   * mjolnir.bg.grid
--   * mjolnir.cmsj.appfinder
--   * mjolnir.fnutils
--   * mjolnir.screen
--   * mjolnir.window;

local appfinder = require "mjolnir.cmsj.appfinder"
local fnutils   = require "mjolnir.fnutils"
local grid      = require "mjolnir.bg.grid"
local screen    = require "mjolnir.screen"
local window    = require "mjolnir.window"

local rpa          = rpa or {}
rpa.utils          = rpa.utils or {}
rpa.utils.monitors = {}

function rpa.utils.monitors.move_app_to_screen(app_name, screen)
  local app = appfinder.app_from_name(app_name)
  if app and screen then
    local windows = app.allwindows()

    for i, win in ipairs(windows) do
      grid.set(win, grid.get(win), screen)
    end
  end
end

function rpa.utils.monitors.move_app_to_screen_and_resize(app_name, screen, frame)
  local app = appfinder.app_from_name(app_name)
  if app and screen then
    local windows = app:allwindows()

    for i, win in ipairs(windows) do
      grid.set(win, frame, screen)
    end
  end
end

-- Return true if the specified screen has the specified dimensions
function rpa.utils.monitors.screen_size_matches(screen, screen_dimensions)
  local frame = screen:fullframe()
  return frame.w == screen_dimensions.w and frame.h == screen_dimensions.h
end

-- Return a list of screens that match the specified dimensions
function rpa.utils.monitors.screens_matching_dimensions(screen_dimensions)
  local screens = screen.allscreens()

  return fnutils.filter(screens, function(screen)
      return rpa.utils.monitors.screen_size_matches(screen, screen_dimensions)
    end)
end

-- Return an east-to-west sorted list of all the screens. If multiple screens are at the same
-- east-west coordinate, the southernmost screen will be first.
function rpa.utils.monitors.screens_east_to_west()
  local screens = screen.allscreens()

  table.sort(screens, function(screen_a, screen_b)
      local frame_a = screen_a:fullframe()
      local frame_b = screen_b:fullframe()

      if frame_a.x == frame_b.x then
        return frame_a.y <= frame_b.y
      else
        return frame_a.x < frame_b.x
      end
    end)

  return screens
end

-- Filter the layout list to the items for a particular screen (i.e. matching the given dimensions).
-- A layout item is of the format
--  {"App name", screen_dimensions, desired_frame}, where
--  dimensions looks like {w = width, h = height}.
function rpa.utils.monitors.layout_items_matching_screen_dimensions(layout, screen_dimensions)
  return fnutils.filter(layout, function(layout_item)
      return layout_item[2].w == screen_dimensions.w and layout_item[2].h == screen_dimensions.h
    end)
end

-- Lay out windows on screens based on the specified layout.
-- Currently won't work as expected if you have more than one screen with the same resolution; all
-- layout items for a screen of that resolution will be performed on the last screen in the list
-- that matches those screen dimensions.
function rpa.utils.monitors.do_layout(layout)
  local screens = screen.allscreens()

  for i, screen in ipairs(screens) do
    local screenframe = screen:fullframe()
    local dimensions = {w = screenframe.w, h = screenframe.h}

    local matching_items = rpa.utils.monitors.layout_items_matching_screen_dimensions(layout, dimensions)

    for i, layout_item in ipairs(matching_items) do
      rpa.utils.monitors.move_app_to_screen_and_resize(layout_item[1], screen, layout_item[3])
    end
  end
end

return rpa.utils.monitors
