
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
            TelescopeResultsBorder = { bg = palette.dark1 },
            TelescopeResultsNormal = { bg = palette.dark1 },
            TelescopePreviewBorder = { bg = palette.dark0_hard },
            TelescopePreviewNormal = { bg = palette.dark0_hard },
        },
        illuminate = {
            IlluminatedWordText  = { bg = palette.dark0, underline = false },
            IlluminatedWordRead  = { bg = palette.dark0, underline = false },
            IlluminatedWordWrite = { bg = palette.dark0, underline = false },
        },
        octo = {
            OctoEditable = { bg = palette.dark0 },
            OctoIssueId = { bg = palette.dark0 },
            OctoRed = { fg = palette.neutral_red },
            OctoBlue = { fg = palette.neutral_blue },
            OctoGreen = { fg = palette.neutral_green },
            OctoPurple = { fg = palette.neutral_purple },
            OctoYellow = { fg = palette.neutral_yellow },
            OctoGrey = { fg = palette.gray },
            OctoRedFloat    = { bg = palette.dark1, fg = palette.neutral_red },
            OctoBlueFloat   = { bg = palette.dark1, fg = palette.neutral_blue },
            OctoGreenFloat  = { bg = palette.dark1, fg = palette.neutral_green },
            OctoPurpleFloat = { bg = palette.dark1, fg = palette.neutral_purple },
            OctoYellowFloat = { bg = palette.dark1, fg = palette.neutral_yellow },
            OctoGreyFloat   = { bg = palette.dark1, fg = palette.gray },
            OctoBubbleRed    = { fg = palette.dark0, bg = palette.faded_red },
            OctoBubbleBlue   = { fg = palette.dark0, bg = palette.faded_blue },
            OctoBubbleGreen  = { fg = palette.dark0, bg = palette.faded_green },
            OctoBubblePurple = { fg = palette.dark0, bg = palette.faded_purple },
            OctoBubbleYellow = { fg = palette.dark0, bg = palette.faded_yellow },
            OctoBubbleGrey =   { fg = palette.dark0, bg = palette.dark2 },
            OctoBubbleDelimiterRed    = { bg = palette.dark0_hard, fg = palette.faded_red },
            OctoBubbleDelimiterBlue   = { bg = palette.dark0_hard, fg = palette.faded_blue },
            OctoBubbleDelimiterGreen  = { bg = palette.dark0_hard, fg = palette.faded_green },
            OctoBubbleDelimiterPurple = { bg = palette.dark0_hard, fg = palette.faded_purple },
            OctoBubbleDelimiterYellow = { bg = palette.dark0_hard, fg = palette.faded_yellow },
            OctoBubbleDelimiterGrey =   { bg = palette.dark0_hard, fg = palette.dark2 },
            OctoViewer = {bg = palette.faded_aqua },
            OctoFilePanelTitle = {fg = palette.faded_aqua },
            OctoFilePanelCounter = {fg = palette.faded_aqua },
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

set_colors()

