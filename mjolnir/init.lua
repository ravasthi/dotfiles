local alert         = require "mjolnir.alert"
local grid          = require "mjolnir.bg.grid"
local hotkey        = require "mjolnir.hotkey"
local monitors      = require "rpa.utils.monitors"
local position      = require "rpa.utils.position"
local screenwatcher = require "mjolnir._asm.watcher.screen"
local window        = require "mjolnir.window"


-- Startup options -------------------------------------------------------------


-- Functions -------------------------------------------------------------------
function smallcenter()
  position.set_position(position.smallcenter(), true)
end

function halfleft()
  position.set_position(position.halfleft())
end

function halfright()
  position.set_position(position.halfright())
end

function halftop()
  position.set_position(position.halftop())
end

function halfbottom()
  position.set_position(position.halfbottom())
end

function quartertopleft()
  position.set_position(position.quartertopleft())
end

function quartertopright()
  position.set_position(position.quartertopright())
end

function quarterbottomleft()
  position.set_position(position.quarterbottomleft())
end

function quarterbottomright()
  position.set_position(position.quarterbottomright())
end

function thirdleft()
  position.set_position(position.thirdleft())
end

function thirdmiddle()
  position.set_position(position.thirdmiddle())
end

function thirdright()
  position.set_position(position.thirdright())
end

function twothirdsleft()
  position.set_position(position.twothirdsleft())
end

function twothirdsright()
  position.set_position(position.twothirdsright())
end

function fivesixthsleft()
  position.set_position(position.fivesixthsleft())
end

function fivesixthsright()
  position.set_position(position.fivesixthsright())
end

function pushwindow(win, screen)
  if screen then
    grid.set(win, grid.get(win), screen)
  end
end

function pushup()
  local win = window.focusedwindow()
  pushwindow(win, win:screen():tonorth())
end

function pushright()
  local win = window.focusedwindow()
  pushwindow(win, win:screen():toeast())
end

function pushdown()
  local win = window.focusedwindow()
  pushwindow(win, win:screen():tosouth())
end

function pushleft()
  local win = window.focusedwindow()
  pushwindow(win, win:screen():towest())
end

-- Screen layouts --------------------------------------------------------------
local laptop_dimensions         = {w = 1440, h = 900}
local cinema_display_dimensions = {w = 2560, h = 1440}
local tv_dimensions             = {w = 1920, h = 1080}

local layout_laptop_only = {
  -- Command line
  {"Terminal", laptop_dimensions, position.halfright()},
  {"iTerm", laptop_dimensions, position.halfright()},

  -- Browsers
  {"Safari", laptop_dimensions, position.maximized()},
  {"Google Chrome", laptop_dimensions, position.maximized()},
  {"Firefox", laptop_dimensions, position.maximized()},
  {"WebKit", laptop_dimensions, position.maximized()},

  -- Text editors
  {"TextMate", laptop_dimensions, position.maximized()},
  {"Sublime Text", laptop_dimensions, position.maximized()},
  {"MacVim", laptop_dimensions, position.maximized()},

  -- Productivity
  {"Calendar", laptop_dimensions, position.maximized()},
  {"Mail", laptop_dimensions, position.maximized()},
  {"Slack", laptop_dimensions, position.maximized()},

  -- Music
  {"iTunes", laptop_dimensions, position.maximized()},
  {"Rdio", laptop_dimensions, position.maximized()},
  {"Spotify", laptop_dimensions, position.maximized()},

  -- Misc
  {"Pro JIRA", laptop_dimensions, position.maximized()},
  {"Marked 2", laptop_dimensions, position.halfright()},
  {"nvALT", laptop_dimensions, position.halfright()},
  {"Pocket", laptop_dimensions, position.maximized()},
  {"Reeder", laptop_dimensions, position.maximized()}
}

local layout_with_cinema_display = {
  -- Command line
  {"Terminal", cinema_display_dimensions, position.thirdright()},
  {"iTerm", cinema_display_dimensions, position.thirdright()},

  -- Browsers
  {"Safari", cinema_display_dimensions, position.twothirdsleft()},
  {"Google Chrome", cinema_display_dimensions, position.twothirdsleft()},
  {"Firefox", cinema_display_dimensions, position.twothirdsleft()},
  {"WebKit", cinema_display_dimensions, position.twothirdsleft()},

  -- Text editors
  {"TextMate", cinema_display_dimensions, position.twothirdsleft()},
  {"Sublime Text", cinema_display_dimensions, position.twothirdsleft()},
  {"MacVim", cinema_display_dimensions, position.twothirdsleft()},

  -- Productivity
  {"Calendar", laptop_dimensions, position.maximized()},
  {"Mail", laptop_dimensions, position.maximized()},
  {"Slack", laptop_dimensions, position.maximized()},

  -- Music
  {"iTunes", laptop_dimensions, position.maximized()},
  {"Rdio", laptop_dimensions, position.maximized()},
  {"Spotify", laptop_dimensions, position.maximized()},

  -- Misc
  {"Pro JIRA", laptop_dimensions, position.maximized()},
  {"Marked 2", cinema_display_dimensions, position.thirdright()},
  {"nvALT", cinema_display_dimensions, position.thirdright()},
  {"Pocket", laptop_dimensions, position.maximized()},
  {"Reeder", laptop_dimensions, position.maximized()}
}

local layout_with_tv = layout_laptop_only

function do_layout_laptop_only()
  monitors.do_layout(layout_laptop_only)
end

function do_layout_with_cinema_display()
  monitors.do_layout(layout_with_cinema_display)
end

function do_layout_with_tv()
  monitors.do_layout(layout_with_tv)
end

function handle_screen_changes()
  local screens = monitors.screens_east_to_west()

  if #screens == 1 then
    do_layout_laptop_only()
  else
    local cinema_display = monitors.screens_matching_dimensions(cinema_display_dimensions)
    local tv             = monitors.screens_matching_dimensions(tv_dimensions)

    if #cinema_display > 0 then
      do_layout_with_cinema_display()
    elseif #tv > 0 then
      do_layout_with_tv()
    else
      -- For other, unrecognized screens, leave all windows on main laptop screen
      do_layout_laptop_only()
    end
  end
end

screenwatcher.new(handle_screen_changes):start()


-- Key bindings ----------------------------------------------------------------
hotkey.bind({"ctrl"},                 "1",     grid.maximize_window)
hotkey.bind({"ctrl", "shift"},        "1",     smallcenter)
hotkey.bind({"ctrl"},                 "2",     halfleft)
hotkey.bind({"ctrl", "shift"},        "2",     halfright)
hotkey.bind({"ctrl"},                 "3",     halftop)
hotkey.bind({"ctrl", "shift"},        "3",     halfbottom)
hotkey.bind({"ctrl"},                 "4",     thirdleft)
hotkey.bind({"ctrl", "shift"},        "4",     thirdright)
hotkey.bind({"ctrl", "shift", "alt"}, "4",     thirdmiddle)
hotkey.bind({"ctrl"},                 "5",     twothirdsleft)
hotkey.bind({"ctrl", "shift"},        "5",     twothirdsright)
hotkey.bind({"ctrl"},                 "6",     fivesixthsleft)
hotkey.bind({"ctrl", "shift"},        "6",     fivesixthsright)
hotkey.bind({"ctrl"},                 "7",     quartertopleft)
hotkey.bind({"ctrl", "shift"},        "7",     quarterbottomleft)
hotkey.bind({"ctrl"},                 "8",     quartertopright)
hotkey.bind({"ctrl", "shift"},        "8",     quarterbottomright)
hotkey.bind({"cmd", "alt"},           "up",    pushup)
hotkey.bind({"cmd", "alt"},           "right", pushright)
hotkey.bind({"cmd", "alt"},           "down",  pushdown)
hotkey.bind({"cmd", "alt"},           "left",  pushleft)
hotkey.bind({"ctrl", "shift"},        "\\",    do_layout_laptop_only)
hotkey.bind({"ctrl"},                 "\\",    do_layout_with_cinema_display)
hotkey.bind({"ctrl"},                 "/",     do_layout_with_tv)

