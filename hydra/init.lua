require "ext.grid.init"

-- Startup options -------------------------------------------------------------
-- show an alert to let you know Hydra's running
hydra.alert("Hydra config loaded", 1.5)

-- open a repl with mash-R; requires https://github.com/sdegutis/hydra-cli
hotkey.bind({"cmd", "ctrl", "alt"}, "R", repl.open)
hotkey.bind({"cmd", "ctrl", "alt"}, "1", hydra.reload)

-- show a helpful menu
hydra.menu.show(function()
    local t = {
      {title = "Reload config", fn = hydra.reload},
      {title = "Open REPL", fn = repl.open},
      {title = "-"},
      {title = "About Hydra", fn = hydra.showabout},
      {title = "Check for updates…", fn = function() hydra.updates.check(nil, true) end},
      {title = "Quit", fn = os.exit},
    }

    if not hydra.license.haslicense() then
      table.insert(t, 1, {title = "Buy or enter license…", fn = hydra.license.enter})
      table.insert(t, 2, {title = "-"})
    end

    return t
end)

-- uncomment this line if you want Hydra to make sure it launches at login
-- hydra.autolaunch.set(true)

-- when the "update is available" notification is clicked, open the website
notify.register("showupdate", function() os.execute('open https://github.com/sdegutis/Hydra/releases') end)

-- check for updates every week, and also right now (when first launching)
timer.new(timer.weeks(1), hydra.updates.check):start()
hydra.updates.check()


-- Functions -------------------------------------------------------------------
function small_center()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.h = newframe.h / 2
  newframe.x = newframe.x + newframe.w / 2
  newframe.y = newframe.y + newframe.h / 2
  win:setframe(newframe)
end

function halfleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function halfright()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 2, y = 0, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function halftop()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDCOLS, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function halfbottom()
  local win = window.focusedwindow()
  local f = {x = 0, y = ext.grid.GRIDROWS / 2, w = ext.grid.GRIDCOLS, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function quartertopleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function quartertopright()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 2, y = 0, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function quarterbottomleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = ext.grid.GRIDROWS / 2, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function quarterbottomright()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 2, y = ext.grid.GRIDROWS / 2, w = ext.grid.GRIDCOLS / 2, h = ext.grid.GRIDROWS / 2}
  ext.grid.set(win, f, win:screen())
end

function thirdleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = ext.grid.GRIDCOLS / 3, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function thirdmiddle()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 3, y = 0, w = ext.grid.GRIDCOLS / 3, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function thirdright()
  local win = window.focusedwindow()
  local f = {x = 2 * ext.grid.GRIDCOLS / 3, y = 0, w = ext.grid.GRIDCOLS / 3, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function twothirdsleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = 2 * ext.grid.GRIDCOLS / 3, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function twothirdsright()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 3, y = 0, w = 2 * ext.grid.GRIDCOLS / 3, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function fivesixthsleft()
  local win = window.focusedwindow()
  local f = {x = 0, y = 0, w = 5 * ext.grid.GRIDCOLS / 6, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

function fivesixthsright()
  local win = window.focusedwindow()
  local f = {x = ext.grid.GRIDCOLS / 6, y = 0, w = 5 * ext.grid.GRIDCOLS / 6, h = ext.grid.GRIDROWS}
  ext.grid.set(win, f, win:screen())
end

-- Key bindings ----------------------------------------------------------------
hotkey.new({"ctrl"}, "1", ext.grid.maximize_window):enable()
hotkey.new({"ctrl", "shift"}, "1", small_center):enable()
hotkey.new({"ctrl"}, "2", halfleft):enable()
hotkey.new({"ctrl", "shift"}, "2", halfright):enable()
hotkey.new({"ctrl"}, "3", halftop):enable()
hotkey.new({"ctrl", "shift"}, "3", halfbottom):enable()
hotkey.new({"ctrl"}, "4", thirdleft):enable()
hotkey.new({"ctrl", "shift"}, "4", thirdright):enable()
hotkey.new({"ctrl", "shift", "alt"}, "4", thirdmiddle):enable()
hotkey.new({"ctrl"}, "5", twothirdsleft):enable()
hotkey.new({"ctrl", "shift"}, "5", twothirdsright):enable()
hotkey.new({"ctrl"}, "6", fivesixthsleft):enable()
hotkey.new({"ctrl", "shift"}, "6", fivesixthsright):enable()
hotkey.new({"ctrl"}, "7", quartertopleft):enable()
hotkey.new({"ctrl", "shift"}, "7", quarterbottomleft):enable()
hotkey.new({"ctrl"}, "8", quartertopright):enable()
hotkey.new({"ctrl", "shift"}, "8", quarterbottomright):enable()
hotkey.new({"cmd", "alt"}, "left", ext.grid.pushwindow_prevscreen):enable()
hotkey.new({"cmd", "alt"}, "right", ext.grid.pushwindow_nextscreen):enable()

