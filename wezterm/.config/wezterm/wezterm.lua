local wezterm = require("wezterm")
return {
    font = wezterm.font("JetBrains Mono"),
    font_size = 14,
    default_prog = { "/usr/bin/bash" },
    colors = {
        foreground = "#ebdbb2",
        background = "#1d2021",
        cursor_bg = "#ebdbb2",
        cursor_border = "#ebdbb2",
        cursor_fg = "#1d2021",
        selection_bg = "#ebdbb2",
        selection_fg = "#504945",
        ansi = { "#1d2021", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
        brights = { "#928374", "#fb4934", "#b8bb26", "#fabc2f", "#83a598", "#d3849b", "#8ec07c", "#ebdbb2" },
    },
    enable_tab_bar = false,
    window_decorations = "RESIZE",
    window_close_confirmation = "AlwaysPrompt",
    skip_close_confirmation_for_processes_named = { "bash" },
    audible_bell = "Disabled",
    disable_default_key_bindings = true,
    keys = {
        { key = "n", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },
        { key = "c", mods = "CTRL|SHIFT", action = { CopyTo = "Clipboard" } },
        { key = "v", mods = "CTRL|SHIFT", action = { PasteFrom = "Clipboard" } },
        { key = "+", mods = "CTRL|SHIFT", action = wezterm.action.IncreaseFontSize },
        { key = "_", mods = "CTRL|SHIFT", action = wezterm.action.DecreaseFontSize },
        { key = "0", mods = "CTRL|SHIFT", action = wezterm.action.ResetFontSize },
    },
    term = "wezterm",
    -- debug_key_events = true,
    hyperlink_rules = {
        -- Linkify things that look like URLs and the host has a TLD name.
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },

        -- linkify email addresses
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = "mailto:$0",
        },

        -- file:// URI
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\bfile://\S*\b]],
            format = "$0",
        },

        -- Linkify things that look like URLs with numeric addresses as hosts.
        -- E.g. http://127.0.0.1:8000 for a local development server,
        -- or http://192.168.1.1 for the web interface of many routers.
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = "$0",
        },

        -- Make task numbers clickable
        -- The first matched regex group is captured in $1.
        {
            regex = [[\b[tT](\d+)\b]],
            format = "https://example.com/tasks/?t=$1",
        },

        -- Make username/project paths clickable. This implies paths like the following are for GitHub.
        -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
        -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
        -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = "https://www.github.com/$1/$3",
        },
    },
}
