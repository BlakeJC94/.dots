-- If Lua Rocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("main.error-handling")

-- Themes define colours, icons, font and wallpapers.
require("main.theme")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

require("main.layouts")
require("main.menu")
require("main.wibar")
require("main.binds-mouse")
require("main.binds-keys")
require("main.rules")
require("main.signals")
