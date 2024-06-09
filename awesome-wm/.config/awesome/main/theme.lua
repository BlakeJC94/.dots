local gears = require("gears")
local beautiful = require("beautiful")

beautiful.init(gears.filesystem.get_themes_dir() .. "zenburn/theme.lua")
beautiful.wallpaper = os.getenv("HOME").."/.config/awesome/background.png"
