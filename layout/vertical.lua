local awful = require("awful")
local gcolor = require("gears.color")
local beautiful = require("beautiful")
local pairs = pairs

local mylayout = {}

mylayout.name = "vertical"
function mylayout.arrange(p)
    local area
    area = p.workarea
    for idx, c in pairs(p.clients) do
      local g
      if #p.clients == 1 then -- if only one client make fullscreen and leave
        g = {
          x = area.x,
          y = area.y,
          width = area.width,
          height = area.height
        }
      elseif idx == 1 then -- if client is master
        g = {
          x = area.x,
          y = area.y,
          width = area.width * awful.tag.getmwfact(),
          height = area.height
        }
      else -- if client is slave
        g = {
          x = area.x + (area.width * awful.tag.getmwfact()) + (idx-2) * ((area.width * (1-awful.tag.getmwfact())) / (#p.clients - 1)),
          y = area.y,
          width = ( area.width * (1-awful.tag.getmwfact()) ) / ( #p.clients - 1),
          height = area.height
        }
      end
      p.geometries[c] = g
    end
end

local icon_raw = beautiful.config_path .. "/icon/layouts/vertical.png"

local function get_icon()
   if icon_raw ~= nil then
      return gcolor.recolor_image(icon_raw, beautiful.fg_normal)
   else
      return nil
   end
end


return {
  layout = mylayout,
  icon_raw = icon_raw,
  get_icon = get_icon,
}
