-- MODULE no_single_client_round_corners
-- remove round corners when there is only one client / the focused client is maximized

-- Requires the following properties
--		beautiful.corner_radius

local gears = require("gears")
local beautiful = require("beautiful")

local corner_radius = beautiful.corner_radius or 0

-- Round corners
-- but if window fills screen, remove rounded corners and translucent borders
-- helper function is_maximized
local function is_maximized(c)

	local function _fills_screen()
		local wa = c.screen.workarea
		local cg = c:geometry()
		return wa.x == cg.x and wa.y == cg.y and wa.width == cg.width and wa.height == cg.height
	end

	return c.maximized or (not c.floating and _fills_screen())
end

-- No round corners for maximized clients
-- local up = true
client.connect_signal("property::geometry", function(c)
    if is_maximized(c) then
        c.shape = function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,0)
        end
    else
        c.shape = function(cr,w,h)
              gears.shape.rounded_rect(cr,w,h, corner_radius)
        end
    end
end)