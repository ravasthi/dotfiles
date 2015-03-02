local alert    = require "mjolnir.alert"
local grid     = require "mjolnir.bg.grid"
local hotkey   = require "mjolnir.hotkey"
local position = require "rpa.utils.position"


-- Startup options -------------------------------------------------------------
-- -- show an alert to let you know Mjolnir's running
-- alert("Mjolnir config loaded", 1.5)
--
-- -- open a repl with mash-R; requires https://github.com/sdegutis/Mjolnir-cli
-- hotkey.bind({"cmd", "ctrl", "alt"}, "R", repl.open)
-- hotkey.bind({"cmd", "ctrl", "alt"}, "1", Mjolnir.reload)
--
-- -- show a helpful menu
-- mjolnir.menu.show(function()
--     local t = {
--       {title = "Reload config", fn = mjolnir.reload},
--       {title = "Open REPL", fn = repl.open},
--       {title = "-"},
--       {title = "About Mjolnir", fn = mjolnir.showabout},
--       {title = "Check for updates…", fn = function() Mjolnir.updates.check(nil, true) end},
--       {title = "Quit", fn = os.exit},
--     }
--
--     if not Mjolnir.license.haslicense() then
--       table.insert(t, 1, {title = "Buy or enter license…", fn = Mjolnir.license.enter})
--       table.insert(t, 2, {title = "-"})
--     end
--
--     return t
-- end)
--
-- -- uncomment this line if you want Mjolnir to make sure it launches at login
-- -- mjolnir.autolaunch.set(true)
--
-- -- when the "update is available" notification is clicked, open the website
-- notify.register("showupdate", function() os.execute('open https://github.com/sdegutis/Mjolnir/releases') end)
--
-- -- check for updates every week, and also right now (when first launching)
-- timer.new(timer.weeks(1), mjolnir.updates.check):start()
-- mjolnir.updates.check()


-- Functions -------------------------------------------------------------------
function small_center()
  position.set_position(position.small_center(), true)
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


-- Key bindings ----------------------------------------------------------------
hotkey.bind({"ctrl"}, "1", grid.maximize_window)
hotkey.bind({"ctrl", "shift"}, "1", small_center)
hotkey.bind({"ctrl"}, "2", halfleft)
hotkey.bind({"ctrl", "shift"}, "2", halfright)
hotkey.bind({"ctrl"}, "3", halftop)
hotkey.bind({"ctrl", "shift"}, "3", halfbottom)
hotkey.bind({"ctrl"}, "4", thirdleft)
hotkey.bind({"ctrl", "shift"}, "4", thirdright)
hotkey.bind({"ctrl", "shift", "alt"}, "4", thirdmiddle)
hotkey.bind({"ctrl"}, "5", twothirdsleft)
hotkey.bind({"ctrl", "shift"}, "5", twothirdsright)
hotkey.bind({"ctrl"}, "6", fivesixthsleft)
hotkey.bind({"ctrl", "shift"}, "6", fivesixthsright)
hotkey.bind({"ctrl"}, "7", quartertopleft)
hotkey.bind({"ctrl", "shift"}, "7", quarterbottomleft)
hotkey.bind({"ctrl"}, "8", quartertopright)
hotkey.bind({"ctrl", "shift"}, "8", quarterbottomright)
hotkey.bind({"cmd", "alt"}, "left", grid.pushwindow_prevscreen)
hotkey.bind({"cmd", "alt"}, "right", grid.pushwindow_nextscreen)

