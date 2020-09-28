local gcolor = require("gears.color")
local beautiful = require("beautiful")
local pairs = pairs

local mylayout = {}

mylayout.name = "horizontal"
function mylayout.arrange(p)
    local area
    area = p.workarea
    local i = 0
    for _, c in pairs(p.clients) do
            local g = {
                    x = area.x,
                    y = area.y + i * (area.height / #p.clients),
                    width = area.width,
                    height = area.height / #p.clients,
            }
            p.geometries[c] = g
            i = i + 1
    end
end

local icon_raw = beautiful.config_path .. "/icon/layouts/horizontal.png"

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
