--[[ key binding helpers ]]
Map = function(tbl)
    for key, value in pairs(tbl) do
            vim.keymap.set(value[1], value[2], value[3], value[4])
    end
end

local rc_augroup = vim.api.nvim_create_augroup("lua-rc", {})
autocmd = function(what, callback, pattern, group)
    vim.api.nvim_create_autocmd(what, {
        group = group or rc_augroup,
        pattern = pattern or "*",
        callback = callback
    })
end

--[[ bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke.lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- [[ plugins ]]
require("lazy").setup({
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = true,
    },
    {
        "davidosomething/vim-colors-meh",
        config = function() vim.cmd[[colorscheme meh]] end,
    },
}, {
    change_detection = { notify = false },
})

--[[ lsp setup ]]
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        Map({
            { "n", "gd", lsp.definition, opts },
            { "n", "gD", lsp.declaration, opts },
            { "n", "K", lsp.hover, opts },
            { "n", "gi", lsp.implementation, opts },
            { "n", "gr", lsp.references, opts },
            { "n", "<leader>rn", lsp.rename, opts },
            { "n", "<leader>ca", lsp.code_action, opts },
        })
    end,
})

vim.api.nvim_create_user_command('Scratch', function(opts)
    local name = opts.args ~= '' and opts.args or 'Scratch'
    local bufname = '*' .. name .. '*'

    local bufnr = vim.fn.bufnr(bufname)

    if bufnr == -1 then
        -- create new buffer
        bufnr = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_set_name(bufnr, bufname)
        vim.bo[bufnr].buftype = 'nofile'
        vim.bo[bufnr].bufhidden = 'hide'

        -- detect filetype from extension
        local ext = name:match('%.([^%.]+)$')
        if ext then
            vim.bo[bufnr].filetype = vim.filetype.match({ filename = name }) or ''
        end
    end

    vim.api.nvim_set_current_buf(bufnr)
end, { nargs = '?' })

autocmd("TextYankPost", function() vim.highlight.on_yank { timeout = 666 } end)
