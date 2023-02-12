
function set_colors(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    local status_ok, palette = pcall(require, "gruvbox.palette")
    if not status_ok then
        return
    end

    local plugin_overrides = {
        telescope = {
            TelescopePromptBorder  = { bg = palette.dark0_hard },
            TelescopePromptNormal  = { bg = palette.dark0_hard },
            TelescopeResultsBorder = { bg = palette.dark0_hard },
            TelescopeResultsNormal = { bg = palette.dark0_hard },
            TelescopePreviewBorder = { bg = palette.dark0_hard },
            TelescopePreviewNormal = { bg = palette.dark0_hard },
        },
        illuminate = {
            IlluminatedWordText  = { bg = palette.dark0, underline = false },
            IlluminatedWordRead  = { bg = palette.dark0, underline = false },
            IlluminatedWordWrite = { bg = palette.dark0, underline = false },
        },
    }

    for plugin, overrides in pairs(plugin_overrides) do
        local ok, _ = pcall(require, plugin)
        if ok then
            for group, settings in pairs(overrides) do
                vim.api.nvim_set_hl(0, group, settings)
            end
        end
    end
end

-- set_colors()

