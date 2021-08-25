-- Hammerspoon utils - layouts
-- richa@avasthi.name
-- Functions to move and size windows.
local application = require "hs.application"
local layout = require "hs.layout"
local monitors = require "rpa.utils.monitors"
local position = require "rpa.utils.position"
local window = require "hs.window"

local rpa = rpa or {}
rpa.utils = rpa.utils or {}
rpa.utils.layouts = {}

-- Screen layouts --------------------------------------------------------------
local laptop = monitors.findScreen(1440, 900)
local thunderboltDisplays = monitors.sortedScreensBySize(2560, 1440)
local tv = monitors.findScreen(1920, 1080)
local monitor4k = monitors.findScreen(1920, 1080)
local iMac = monitors.findScreen(2560, 1440)

local layoutImac = {
  -- Command line
  {"iTerm", nil, iMac, position.halfRight(), nil, nil},
  {"iTerm2", nil, iMac, position.halfRight(), nil, nil},
  {"Terminal", nil, iMac, position.halfRight(), nil, nil},
  -- Browsers
  {"Firefox", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Safari", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"WebKit", nil, iMac, position.twoThirdsLeft(), nil, nil},
  -- Development
  {"Atom", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Code", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"CodeKit", nil, iMac, position.thirdRight(), nil, nil},
  {"IntelliJ IDEA", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"MacVim", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"TextMate", nil, iMac, position.twoThirdsLeft(), nil, nil},
  -- Productivity
  {"Bear", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Calendar", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"Fantastical", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"HipChat", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Jira", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"Kiwi for Gmail", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Mail", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Microsoft Excel", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Microsoft PowerPoint", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Microsoft Word", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"MindNode", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Nylas Mail", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Ora", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"Outlook", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Slack", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Spark", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Superhuman", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Things", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"Todoist", nil, iMac, position.twoThirdsCenter(), nil, nil},
  {"Ulysses", nil, iMac, position.twoThirdsLeft(), nil, nil},
  -- Design
  {"Affinity Designer", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Affinity Publisher", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Sketch", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion", nil, iMac, position.fiveSixthsLeft(), nil, nil},
  {"Zeplin", nil, iMac, position.twoThirdsLeft(), nil, nil},
  -- Music
  {"iTunes", nil, iMac, position.halfLeft(), nil, nil},
  {"Music", nil, iMac, position.halfLeft(), nil, nil},
  {"TV", nil, iMac, position.halfLeft(), nil, nil},
  {"Podcasts", nil, iMac, position.halfLeft(), nil, nil},
  {"Spotify", nil, iMac, position.smallCenter(), nil, nil},
  -- Misc
  {"Dash", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, iMac, position.thirdRight(), nil, nil},
  {"nvALT", nil, iMac, position.thirdRight(), nil, nil},
  {"Pocket", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Reeder", nil, iMac, position.twoThirdsLeft(), nil, nil}
}

local layoutLaptopOnly = {
  -- Command line
  {"iTerm", nil, laptop, position.twoThirdsRight(), nil, nil},
  {"iTerm2", nil, laptop, position.twoThirdsRight(), nil, nil},
  {"Terminal", nil, laptop, position.twoThirdsRight(), nil, nil},
  -- Browsers
  {"Firefox", nil, laptop, layout.maximized, nil, nil},
  {"FirefoxDeveloperEdition", nil, laptop, layout.maximized, nil, nil},
  {"Google Chrome", nil, laptop, layout.maximized, nil, nil},
  {"Safari Technology Preview", nil, laptop, layout.maximized, nil, nil},
  {"Safari", nil, laptop, layout.maximized, nil, nil},
  {"WebKit", nil, laptop, layout.maximized, nil, nil},
  -- Development
  {"Atom", nil, laptop, layout.maximized, nil, nil},
  {"Code", nil, laptop, layout.maximized, nil, nil},
  {"CodeKit", nil, laptop, layout.maximized, nil, nil},
  {"IntelliJ IDEA", nil, laptop, layout.maximized, nil, nil},
  {"MacVim", nil, laptop, layout.maximized, nil, nil},
  {"Sublime Text", nil, laptop, layout.maximized, nil, nil},
  {"TextMate", nil, laptop, layout.maximized, nil, nil},
  -- Productivity
  {"Bear", nil, laptop, layout.maximized, nil, nil},
  {"Calendar", nil, laptop, layout.maximized, nil, nil},
  {"Fantastical", nil, laptop, layout.maximized, nil, nil},
  {"HipChat", nil, laptop, layout.maximized, nil, nil},
  {"Jira", nil, laptop, layout.maximized, nil, nil},
  {"Kiwi for Gmail", nil, laptop, layout.maximized, nil, nil},
  {"Mail", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft Excel", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft PowerPoint", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft Word", nil, laptop, layout.maximized, nil, nil},
  {"MindNode", nil, laptop, layout.maximized, nil, nil},
  {"Nylas Mail", nil, laptop, layout.maximized, nil, nil},
  {"Ora", nil, laptop, layout.maximized, nil, nil},
  {"Outlook", nil, laptop, layout.maximized, nil, nil},
  {"Slack", nil, laptop, layout.maximized, nil, nil},
  {"Spark", nil, laptop, layout.maximized, nil, nil},
  {"Superhuman", nil, laptop, layout.maximized, nil, nil},
  {"Things", nil, laptop, layout.maximized, nil, nil},
  {"Todoist", nil, laptop, layout.maximized, nil, nil},
  {"Ulysses", nil, laptop, layout.maximized, nil, nil},
  -- Design
  {"Affinity Designer", nil, laptop, layout.maximized, nil, nil},
  {"Affinity Photo", nil, laptop, layout.maximized, nil, nil},
  {"Affinity Publisher", nil, laptop, layout.maximized, nil, nil},
  {"Sketch", nil, laptop, layout.maximized, nil, nil},
  {"Suitcase Fusion", nil, laptop, layout.maximized, nil, nil},
  {"Zeplin", nil, laptop, layout.maximized, nil, nil},
  -- Music
  {"iTunes", nil, laptop, layout.maximized, nil, nil},
  {"Music", nil, laptop, layout.maximized, nil, nil},
  {"TV", nil, laptop, layout.maximized, nil, nil},
  {"Podcasts", nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},
  -- Misc
  {"Dash", nil, laptop, layout.maximized, nil, nil},
  {"Marked 2", nil, laptop, position.halfRight(), nil, nil},
  {"nvALT", nil, laptop, position.halfRight(), nil, nil},
  {"Pocket", nil, laptop, layout.maximized, nil, nil},
  {"Reeder", nil, laptop, layout.maximized, nil, nil}
}

local layoutWith4kDisplay = {
  -- Command line
  {"iTerm", nil, monitor4k, position.halfRight(), nil, nil},
  {"iTerm2", nil, monitor4k, position.halfRight(), nil, nil},
  {"Terminal", nil, monitor4k, position.halfRight(), nil, nil},
  -- Browsers
  {"Firefox", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"FirefoxDeveloperEdition", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Google Chrome", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Safari Technology Preview", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Safari", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"WebKit", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  -- Development
  {"Atom", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Code", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"CodeKit", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"IntelliJ IDEA", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"MacVim", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Sublime Text", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"TextMate", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  -- Productivity
  {"Bear", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Calendar", nil, laptop, layout.maximized, nil, nil},
  {"Fantastical", nil, laptop, layout.maximized, nil, nil},
  {"HipChat", nil, laptop, layout.maximized, nil, nil},
  {"Jira", nil, laptop, layout.maximized, nil, nil},
  {"Kiwi for Gmail", nil, laptop, layout.maximized, nil, nil},
  {"Mail", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft Excel", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Microsoft PowerPoint", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Microsoft Word", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"MindNode", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Nylas Mail", nil, laptop, layout.maximized, nil, nil},
  {"Ora", nil, laptop, layout.maximized, nil, nil},
  {"Outlook", nil, laptop, layout.maximized, nil, nil},
  {"Slack", nil, laptop, layout.maximized, nil, nil},
  {"Spark", nil, laptop, layout.maximized, nil, nil},
  {"Superhuman", nil, laptop, layout.maximized, nil, nil},
  {"Things", nil, laptop, layout.maximized, nil, nil},
  {"Todoist", nil, laptop, layout.maximized, nil, nil},
  {"Ulysses", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  -- Design
  {"Affinity Designer", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Affinity Photo", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Affinity Publisher", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Sketch", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Suitcase Fusion", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Zeplin", nil, laptop, layout.maximized, nil, nil},
  -- Music
  {"iTunes", nil, laptop, layout.maximized, nil, nil},
  {"Movies", nil, laptop, layout.maximized, nil, nil},
  {"TV", nil, laptop, layout.maximized, nil, nil},
  {"Podcasts", nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},
  -- Misc
  {"Dash", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Marked 2", nil, monitor4k, position.halfRight(), nil, nil},
  {"nvALT", nil, monitor4k, position.halfRight(), nil, nil},
  {"Pocket", nil, laptop, layout.maximized, nil, nil},
  {"Reeder", nil, laptop, layout.maximized, nil, nil}
}

local layoutWithThunderboltDisplay = {
  -- Command line
  {"iTerm", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"iTerm2", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"Terminal", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  -- Browsers
  {"Firefox", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"WebKit", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  -- Development
  {"Atom", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Code", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"CodeKit", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"IntelliJ IDEA", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"MacVim", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"TextMate", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  -- Productivity
  {"Bear", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Calendar", nil, laptop, layout.maximized, nil, nil},
  {"Fantastical", nil, laptop, layout.maximized, nil, nil},
  {"HipChat", nil, laptop, layout.maximized, nil, nil},
  {"Jira", nil, laptop, layout.maximized, nil, nil},
  {"Kiwi for Gmail", nil, laptop, layout.maximized, nil, nil},
  {"Mail", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft Excel", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Microsoft PowerPoint", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Microsoft Word", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"MindNode", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Nylas Mail", nil, laptop, layout.maximized, nil, nil},
  {"Ora", nil, laptop, layout.maximized, nil, nil},
  {"Outlook", nil, laptop, layout.maximized, nil, nil},
  {"Slack", nil, laptop, layout.maximized, nil, nil},
  {"Spark", nil, laptop, layout.maximized, nil, nil},
  {"Superhuman", nil, laptop, layout.maximized, nil, nil},
  {"Things", nil, laptop, layout.maximized, nil, nil},
  {"Todoist", nil, laptop, layout.maximized, nil, nil},
  {"Ulysses", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  -- Design
  {"Affinity Designer", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Publisher", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sketch", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion", nil, thunderboltDisplays[1], position.fiveSixthsLeft(), nil, nil},
  {"Zeplin", nil, laptop, layout.maximized, nil, nil},
  -- Music
  {"iTunes", nil, laptop, layout.maximized, nil, nil},
  {"Music", nil, laptop, layout.maximized, nil, nil},
  {"TV", nil, laptop, layout.maximized, nil, nil},
  {"Podcasts", nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},
  -- Misc
  {"Dash", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"nvALT", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"Pocket", nil, laptop, layout.maximized, nil, nil},
  {"Reeder", nil, laptop, layout.maximized, nil, nil}
}

local layoutWithTwoThunderboltDisplays = {
  -- Command line
  {"iTerm", nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},
  {"iTerm2", nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},
  {"Terminal", nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},
  -- Browsers
  {"Firefox", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Google Chrome", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"WebKit", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  -- Development
  {"Atom", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Code", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"CodeKit", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"IntelliJ IDEA", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"MacVim", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sublime Text", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"TextMate", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  -- Productivity
  {"Bear", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  {"Calendar", nil, laptop, layout.maximized, nil, nil},
  {"Fantastical", nil, laptop, layout.maximized, nil, nil},
  {"HipChat", nil, laptop, layout.maximized, nil, nil},
  {"Jira", nil, laptop, layout.maximized, nil, nil},
  {"Kiwi for Gmail", nil, laptop, layout.maximized, nil, nil},
  {"Mail", nil, laptop, layout.maximized, nil, nil},
  {"Microsoft Excel", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  {"Microsoft PowerPoint", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  {"Microsoft Word", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  {"MindNode", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  {"Nylas Mail", nil, laptop, layout.maximized, nil, nil},
  {"Ora", nil, laptop, layout.maximized, nil, nil},
  {"Outlook", nil, laptop, layout.maximized, nil, nil},
  {"Slack", nil, laptop, layout.maximized, nil, nil},
  {"Spark", nil, laptop, layout.maximized, nil, nil},
  {"Superhuman", nil, laptop, layout.maximized, nil, nil},
  {"Things", nil, laptop, layout.maximized, nil, nil},
  {"Todoist", nil, laptop, layout.maximized, nil, nil},
  {"Ulysses", nil, thunderboltDisplays[2], position.twoThirdsLeft(), nil, nil},
  -- Design
  {"Affinity Designer", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Publisher", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sketch", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion", nil, thunderboltDisplays[1], position.fiveSixthsLeft(), nil, nil},
  {"Zeplin", nil, laptop, layout.maximized, nil, nil},
  -- Music
  {"iTunes", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"Music", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"TV", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"Podcasts", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"Spotify", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  -- Misc
  {"Dash", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplays[1], position.halfLeft(), nil, nil},
  {"nvALT", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"Pocket", nil, laptop, layout.maximized, nil, nil},
  {"Reeder", nil, laptop, layout.maximized, nil, nil}
}

local layoutWithTv = layoutLaptopOnly

local spotlightSupportEnabled = false

function rpa.utils.layouts.enableSpotlightSupport()
  if spotlightSupportEnabled == false then
    print("Enabling Spotlight support for name searches.")
    application.enableSpotlightForNameSearches(true)
    spotlightSupportEnabled = true
  end
end

function rpa.utils.layouts.doLayoutImac()
  print("✨ Applying layout for iMac.")
  rpa.utils.layouts.enableSpotlightSupport()
  layout.apply(layoutImac)
end

function rpa.utils.layouts.doLayoutLaptopOnly()
  print("✨ Applying layout for laptop. ✨")
  rpa.utils.layouts.enableSpotlightSupport()
  layout.apply(layoutLaptopOnly)
end

function rpa.utils.layouts.doLayoutWith4kDisplay()
  print("✨ Applying layout for laptop + 4K display. ✨")
  rpa.utils.layouts.enableSpotlightSupport()
  layout.apply(layoutWith4kDisplay)
end

function rpa.utils.layouts.doLayoutWithThunderboltDisplay()
  print("✨ Applying layout for laptop + Thunderbolt display. ✨")
  rpa.utils.layouts.enableSpotlightSupport()
  layout.apply(layoutWithThunderboltDisplay)
end

function rpa.utils.layouts.doLayoutWithTwoThunderboltDisplays()
  print("✨ Applying layout for laptop + two Thunderbolt displays. ✨")
  rpa.utils.layouts.enableSpotlightSupport()
  layout.apply(layoutWithTwoThunderboltDisplays)
end

function rpa.utils.layouts.doLayoutWithTv()
  print("✨ Applying layout for laptop + TV. ✨")
  layout.apply(layoutWithTv)
end

return rpa.utils.layouts
