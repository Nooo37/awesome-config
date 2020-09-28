local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local naughty = require("naughty")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")

local config_path = os.getenv("HOME") .. "/.config/awesome/"


local theme = {}

theme.config_path = config_path
theme.wallpaper = config_path.."wallpaper.png"

theme.corner_radius = dpi(14) --8
theme.font          = "sans 8"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = config_path.."default/submenu.png" --TODO wtf
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- Define the image to load
theme.titlebar_close_button_normal              = config_path.."icon/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = config_path.."icon/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = config_path.."icon/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = config_path.."icon/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = config_path.."icon/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = config_path.."icon/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = config_path.."icon/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = config_path.."icon/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = config_path.."icon/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = config_path.."icon/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = config_path.."icon/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = config_path.."icon/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = config_path.."icon/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = config_path.."icon/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = config_path.."icon/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = config_path.."icon/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = config_path.."icon/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = config_path.."icon/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = config_path.."icon/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = config_path.."icon/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh      = config_path.."icon/layouts/fairhw.png"
theme.layout_fairv      = config_path.."icon/layouts/fairvw.png"
theme.layout_floating   = config_path.."icon/layouts/floatingw.png"
theme.layout_magnifier  = config_path.."icon/layouts/magnifierw.png"
theme.layout_max        = config_path.."icon/layouts/maxw.png"
theme.layout_fullscreen = config_path.."icon/layouts/fullscreenw.png"
theme.layout_tilebottom = config_path.."icon/layouts/tilebottomw.png"
theme.layout_tileleft   = config_path.."icon/layouts/tileleftw.png"
theme.layout_tile       = config_path.."icon/layouts/tilew.png"
theme.layout_tiletop    = config_path.."icon/layouts/tiletopw.png"
theme.layout_spiral     = config_path.."icon/layouts/spiralw.png"
theme.layout_dwindle    = config_path.."icon/layouts/dwindlew.png"
theme.layout_cornernw   = config_path.."icon/layouts/cornernww.png"
theme.layout_cornerne   = config_path.."icon/layouts/cornernew.png"
theme.layout_cornersw   = config_path.."icon/layouts/cornersww.png"
theme.layout_cornerse   = config_path.."icons/layouts/cornersew.png"

theme.icon = {
  main = config_path.."icon/tags/main.png",
  web  = config_path.."icon/tags/web.png",
  code = config_path.."icon/tags/code.png",
  read = config_path.."icon/tags/read.png",
  chat = config_path.."icon/tags/chat.png",
}


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil



theme.font          = "sans 8"

theme.bg_normal     = xrdb.background
theme.bg_focus      = xrdb.color12
theme.bg_urgent     = xrdb.color9
theme.bg_minimize   = xrdb.color8
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = xrdb.foreground
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.gap_single_client = true
theme.useless_gap   = dpi(5)

theme.border_width  = dpi(3)
theme.border_normal = xrdb.color0
theme.border_focus  = theme.bg_focus
theme.border_marked = xrdb.color10

-- colors
theme.xfg                                       = xrdb.foreground or "#FFFFFF"
theme.xbg                                       = xrdb.background or "#1A2026"
theme.xcolor0                                   = xrdb.color0  or "#242D35"
theme.xcolor8                                   = xrdb.color8  or "#526170"
theme.xcolor1                                   = xrdb.color1  or "#FB6396"
theme.xcolor9                                   = xrdb.color9  or "#F92D72"
theme.xcolor2                                   = xrdb.color2  or "#94CF95"
theme.xcolor10                                  = xrdb.color10 or "#6CCB6E"
theme.xcolor3                                   = xrdb.color3  or "#F692B2"
theme.xcolor11                                  = xrdb.color11 or "#F26190"
theme.xcolor4                                   = xrdb.color4  or "#6EC1D6"
theme.xcolor12                                  = xrdb.color12 or "#4CB9D6"
theme.xcolor5                                   = xrdb.color5  or "#CD84C8"
theme.xcolor13                                  = xrdb.color13 or "#C269BC"
theme.xcolor6                                   = xrdb.color6  or "#7FE4D2"
theme.xcolor14                                  = xrdb.color14 or "#58D6BF"
theme.xcolor7                                   = xrdb.color7  or "#CFCFCF"
theme.xcolor15                                  = xrdb.color15 or "#F4F5F2"


theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal


-- taglist
theme.taglist_bg                                = theme.xbg
theme.taglist_bg_focus                          = theme.xcolor13
theme.taglist_fg_focus                          = theme.xfg
theme.taglist_bg_urgent                         = theme.xcolor2
theme.taglist_fg_urgent                         = theme.xfg
theme.taglist_bg_occupied                       = "#00000000"
theme.taglist_fg_occupied                       = theme.xfg
theme.taglist_bg_empty                          = "#00000000"
theme.taglist_fg_empty                          = theme.xcolor8
theme.taglist_bg_volatile                       = "#00000000"
theme.taglist_fg_volatile                       = theme.xcolor15

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = config_path.."default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(100)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:
--
local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_normal, -60), "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_focus, -60), "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "focus", "press"
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Try to determine if we are running light or dark colorscheme:
local bg_numberic_value = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
end
local is_dark_bg = (bg_numberic_value < 383)

-- Generate wallpaper:
-- local wallpaper_bg = xrdb.color8
-- local wallpaper_fg = xrdb.color7
-- local wallpaper_alt_fg = xrdb.color12
-- if not is_dark_bg then
--     wallpaper_bg, wallpaper_fg = wallpaper_fg, wallpaper_bg
-- end
-- theme.wallpaper = function(s)
--     return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
-- end

naughty.config.defaults['icon_size']  = 50
naughty.config.defaults.timeout       = 5
naughty.config.defaults.position      = "top_right"
naughty.config.defaults.bg            = theme.xbg
theme.notification_border_color   = theme.popup_border_color or "#000000"
naughty.config.defaults.border_width  = theme.popup_border_width or 0
naughty.config.defaults.margin = 10
naughty.config.padding = 30
naughty.config.spacing = 30

return theme