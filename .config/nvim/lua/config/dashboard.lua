
vim.g.startify_disable_at_vimenter = 1

local default_project_dir = "$HOME/Workspace/local/"

vim.g.dashboard_custom_header = {
    "                                                     ",
    "                                                     ",
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "                                                     ",
    "                                                     ",
    -- "                                                     ",
}


vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
    -- a = {
    --     description = { "  New Python CLI Project  " },
    --     command = ("TermExec cmd='cookiecutter cli -o %s' direction='float'"):format(default_project_dir),
    -- },
    -- b = {
    --     description = { "  New Flask Project       " },
    --     command = "",
    -- },
    -- c = {
    --     description = { "  REST Client             "},
    --     command = ":e $HOME/code/rest/README.md | :NvimTreeToggle"
    -- },
    -- d = {
    --     description = { "..........................."},
    --     command = "",
    -- },
    e = {
        description = { "  Load Recent Session     " },
        command = "DashboardLoadSession",
    },
    f = {
        description = { "  New File                " },
        command = "DashboardNewFile",
    },
    g = {
        description = { "  Find File               " },
        command = "Telescope find_files",
    },
    h = {
        description = { "  Recently Used Files     " },
        command = "Telescope oldfiles",
    },
    i = {
        description = { "  Settings                " },
        command = ":e " .. "$MYVIMRC | :cd %:p:h | pwd"
    },
}


vim.g.dashboard_custom_footer = ''
-- vim.cmd([[
--     let g:dashboard_custom_footer = 'dashboard#pad(startify#fortune#cowsay())'
-- ]])


