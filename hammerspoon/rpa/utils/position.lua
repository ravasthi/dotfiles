-- Hammerspoon utils - position
-- richa@avasthi.name
-- Rects for setting positions of windows.

local rpa          = rpa or {}
rpa.utils          = rpa.utils or {}
rpa.utils.position = {}

function rpa.utils.position.smallCenter()
  return {
    x = 0.25,
    y = 0.25,
    w = 0.5,
    h = 0.5
  }
end

function rpa.utils.position.halfLeft()
  return {
    x = 0,
    y = 0,
    w = 0.5,
    h = 1
  }
end

function rpa.utils.position.halfRight()
  return {
    x = 0.5,
    y = 0,
    w = 0.5,
    h = 1
  }
end

function rpa.utils.position.halfTop()
  return {
    x = 0,
    y = 0,
    w = 1,
    h = 0.5
  }
end

function rpa.utils.position.halfBottom()
  return {
    x = 0,
    y = 0.5,
    w = 1,
    h = 0.5
  }
end

function rpa.utils.position.quarterTopLeft()
  return {
    x = 0,
    y = 0,
    w = 0.5,
    h = 0.5
  }
end

function rpa.utils.position.quarterTopRight()
  return {
    x = 0.5,
    y = 0,
    w = 0.5,
    h = 0.5
  }
end

function rpa.utils.position.quarterBottomLeft()
  return {
    x = 0,
    y = 0.5,
    w = 0.5,
    h = 0.5
  }
end

function rpa.utils.position.quarterBottomRight()
  return {
    x = 0.5,
    y = 0.5,
    w = 0.5,
    h = 0.5
  }
end

function rpa.utils.position.thirdLeft()
  return {
    x = 0,
    y = 0,
    w = 1/3,
    h = 1
  }
end

function rpa.utils.position.thirdMiddle()
  return {
    x = 1/3,
    y = 0,
    w = 1/3,
    h = 1
  }
end

function rpa.utils.position.thirdRight()
  return {
    x = 2/3,
    y = 0,
    w = 1/3,
    h = 1
  }
end

function rpa.utils.position.twoThirdsLeft()
  return {
    x = 0,
    y = 0,
    w = 2/3,
    h = 1
  }
end

function rpa.utils.position.twoThirdsRight()
  return {
    x = 1/3,
    y = 0,
    w = 2/3,
    h = 1
  }
end

function rpa.utils.position.fiveSixthsLeft()
  return {
    x = 0,
    y = 0,
    w = 5/6,
    h = 1
  }
end

function rpa.utils.position.fiveSixthsRight()
  return {
    x = 1/6,
    y = 0,
    w = 5/6,
    h = 1
  }
end

return rpa.utils.position
