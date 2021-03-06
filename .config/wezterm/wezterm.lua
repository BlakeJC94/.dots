local wezterm = require 'wezterm';
return {
    font = wezterm.font("JetBrains Mono"),
    font_size = 14,
    default_prog = {"/usr/bin/bash"},
    set_environment_variables = { TERM = "wezterm", },
    -- color_scheme = "Gruvbox Dark",
    colors = {
        foreground = "#ebdbb2",
        background = "#1d2021",
        cursor_bg = "#ebdbb2",
        cursor_border = "#ebdbb2",
        cursor_fg = "#1d2021",
        selection_bg = "#ebdbb2",
        selection_fg = "#504945",
        ansi = {"#1d2021","#cc241d","#98971a","#d79921","#458588","#b16286","#689d6a","#a89984"},
        brights = {"#928374","#fb4934","#b8bb26","#fabc2f","#83a598","#d3849b","#8ec07c","#ebdbb2"},
    },
    enable_tab_bar = false,
    window_decorations = "RESIZE",
    window_close_confirmation = "AlwaysPrompt",
    skip_close_confirmation_for_processes_named = {"bash"},
    audible_bell = "Disabled",
    disable_default_key_bindings = true,
    keys = {
        {key="n", mods="CTRL|SHIFT", action="SpawnWindow"},
        {key="c", mods="CTRL|SHIFT", action={CopyTo="Clipboard"}},
        {key="v", mods="CTRL|SHIFT", action={PasteFrom="Clipboard"}},
        {key="-", mods="CTRL|SHIFT", action="DecreaseFontSize"},
        {key="=", mods="CTRL|SHIFT", action="IncreaseFontSize"},
        {key="0", mods="CTRL|SHIFT", action="ResetFontSize"},
    },
}

