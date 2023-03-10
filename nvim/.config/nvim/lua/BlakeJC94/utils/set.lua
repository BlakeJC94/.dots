local function ensure_packer()
    local packer_location = "/site/pack/packer/start/packer.nvim"
    local packer_url = "https://github.com/wbthomason/packer.nvim"
    local install_path = vim.fn.stdpath("data") .. packer_location

    local packer_bootstrap = false
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
        vim.cmd.packadd("packer.nvim")
        packer_bootstrap = true
    end

    return packer_bootstrap
end

local function assemble_packer_module(repo)
    local repo_name = string.match(repo[1], "[^/]+$")
    local config_name = require("BlakeJC94.utils").slugify(repo_name)

    local status_ok, config = pcall(require, "BlakeJC94.configs." .. config_name)
    if not status_ok then
        if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/BlakeJC94/configs/" .. config_name .. ".lua") == 1 then
            local msg = "WARN: issue loading additional config for " .. repo_name .. " (cont Y/n)? "
            if vim.fn.input(msg) == "n" then
                error("abort")
            end
        end
        return repo
    end


    repo = vim.tbl_extend("force", repo, config)
    local repo_processed = {repo[1]}
    local packer_keys = {
        "disable", "as", "installer", "updater", "after", "rtp", "opt", "bufread", "branch", "tag", "commit",
        "lock", "run", "requires", "config", "rocks", "cmd", "ft", "keys", "event", "fn", "cond",
        "setup", "module", "module_pattern",
    }
    for _, k in ipairs(packer_keys) do
        if repo[k] then
            repo_processed[k] = repo[k]
        end
    end

    return repo_processed
end

local function configure_packer(packer)
    packer.init({
        snapshot_path = vim.fn.stdpath("config") .. "/snapshots",
        snapshot = "packer.json",
        max_jobs = 16,
    })
    packer.reset()
    packer.use({ "wbthomason/packer.nvim" })
end

local M = {}

function M.addons(repos)
    local packer_bootstrap = ensure_packer()
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        print("Warning: Packer not properly installed, skipping plugin loading.")
        return
    end
    configure_packer(packer)
    for _, repo in ipairs(repos) do
        packer.use(assemble_packer_module(repo))
    end
    packer.install()
    if packer_bootstrap then
        packer.sync()
    end
end

function M.options(options)
    for k, v in pairs(options) do vim.opt[k] = v end
end

function M.commands(commands)
    local DEFAULT_CMD_OPTS = {force = true}
    for name, command in pairs(commands) do
        if (type(command) == 'table') then
            local opts = vim.tbl_extend('force', DEFAULT_CMD_OPTS, command[2])
            vim.api.nvim_create_user_command(
                name,
                command[1],
                opts
            )
        else
            vim.api.nvim_create_user_command(
                name,
                command,
                DEFAULT_CMD_OPTS
            )
        end
    end
end

function M.mappings(mappings)
    local DEFAULT_MAP_OPTS = {remap = false, silent = true}
    for mode, mode_mappings in pairs(mappings) do
        for keys, mapping in pairs(mode_mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', DEFAULT_MAP_OPTS, mapping.opts)
                vim.keymap.set(mode, keys, mapping.map, opts)
            else
                vim.keymap.set(mode, keys, mapping, DEFAULT_MAP_OPTS)
            end
        end
    end
end

function M.augroups(augroups)
    for name, augroup in pairs(augroups) do
        local id = vim.api.nvim_create_augroup(name, {clear = true})
        for _, autocmd in pairs(augroup) do
            vim.api.nvim_create_autocmd(
                autocmd.events,
                {
                    group = id,
                    pattern = autocmd.pattern,
                    callback = autocmd.callback,
                }
            )
        end
    end
end

return M
