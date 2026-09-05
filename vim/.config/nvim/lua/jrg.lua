return vim.tbl_deep_extend("force",
    require("jrg.jrg"),
    {
        lsp = require("jrg.lsp"),
    }
)
