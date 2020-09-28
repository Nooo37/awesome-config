local awful = require("awful")

-- -- manual layout
local machi = require("layout.machi")
require("beautiful").layout_machi = machi.get_icon()
local editor = machi.editor.create()

local vertical = require("layout.vertical")
require("beautiful").layout_vertical = vertical.get_icon()

local horizontal = require("layout.horizontal")
require("beautiful").layout_horizontal = horizontal.get_icon()

-- awful.layout.suit.tile.left.mirror = true
awful.layout.layouts = {
    awful.layout.suit.tile,
    vertical.layout,
    horizontal.layout,
    -- require("layout.treetile"),
    machi.default_layout,
    awful.layout.suit.spiral,
    awful.layout.suit.floating,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}


awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])