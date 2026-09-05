local lua_ls_cfg = {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            workspace = {
                checkThirdParty = false,
                -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
                    '${3rd}/luv/library',
                    '${3rd}/busted/library',
                }),
            },
        })
    end,
    settings = {
        Lua = {},
    },
}


local lsp_servers = {
    clangd = {},
    gopls = {},
    lua_ls = lua_ls_cfg,
    mesonlsp = {},
}

local ensure_installed =
{
    clangd,
    gopls,
    lua_ls,
    mesonlsp,
}

local mason_cfg = {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup({
            registries = {
                "github:Crashdummyy/mason-registry",
                "github:mason-org/mason-registry",
            },
        })
    end,
}

local lspconfig =
{
    "neovim/nvim-lspconfig",
    dependencies =
    {
        mason_cfg,
        "j-hui/fidget.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
}

return {
    lazy = lspconfig,
}
