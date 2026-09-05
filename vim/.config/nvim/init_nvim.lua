local rc_util = require('rc-util')
local rc_lsp  = require('rc-lsp')

--[[ bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)


-- [[ plugins ]]
require("lazy").setup({
  { import = 'jrg.vcs' },
  { import = 'jrg.lsp' },
  { import = 'jrg.ui' },
  { import = 'jrg.zk' },
}, {
    change_detection = { notify = false },
})

--[[ lsp setup ]]

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

