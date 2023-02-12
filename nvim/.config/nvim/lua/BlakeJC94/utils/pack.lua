local M = {}

function M.ensure_packer()
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

function M.assemble_packer_module(repo)
    local repo_name = string.match(repo[1], "[^/]+$")
    local config_name = string.gsub(repo_name, "[ %\\%/-.,=:;><]+", "_")

    local status_ok, config = pcall(require, "BlakeJC94.configs." .. config_name)
    if not status_ok then
        return repo
    end

    repo = vim.tbl_extend("force", repo, config)
    return repo
end

function M.configure_packer(packer)
    packer.init({
        snapshot_path = vim.fn.stdpath("config") .. "/snapshots",
        snapshot = "packer.json",
        max_jobs = 16,
    })
    packer.reset()
    packer.use({ "wbthomason/packer.nvim" })
end

return M

