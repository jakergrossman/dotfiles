local rc_util = require('rc-util')
rc_util.autocmd("TextYankPost", function() vim.highlight.on_yank { timeout = 666 } end)

return {
    -- {
    --     -- "davidosomething/vim-colors-meh",
    --     "blazkowolf/gruber-darker.nvim",
    --     config = function() vim.cmd[[colorscheme gruber-darker]] end,
    -- },
    -- {
    --     "andreasvc/vim-256noir",
    --     config = function() vim.cmd[[colorscheme 256_noir]] end,
    -- },
    -- { 
    --     "zekzekus/menguless",
    --     config = function() vim.cmd[[colorscheme menguless]] end,
    -- },
    { 
        "sainnhe/gruvbox-material",
        config = function() vim.cmd[[colorscheme gruvbox-material]] end,
    },
}
