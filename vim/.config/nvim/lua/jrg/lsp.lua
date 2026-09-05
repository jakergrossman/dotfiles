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

local ensure_installed = {}

local lsp_servers = {
    clangd = {},
    gopls = {},
    lua_ls = lua_ls_cfg,
}

local lsp_attach = function()
end

local lspconfig = {
}

return {
  {
  "neovim/nvim-lspconfig",
      dependencies = {
          {
              'mason-org/mason.nvim',
              config = function ()
                  require ("mason").setup({
                      registries = {
                          "github:Crashdummyy/mason-registry",
                          "github:mason-org/mason-registry",
                      },
                  })
              end,
          },
          'j-hui/fidget.nvim',
          'mason-org/mason-lspconfig.nvim',
          'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
  },
  {
      "renerocksai/telekasten.nvim",
      dependencies = { "nvim-telescope/telescope.nvim" },   
      config = function ()
          require("telekasten").setup({
              home = vim.fn.expand("/work/roam"),
              new_note_filename = "title",
          })
          vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
          vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
          vim.keymap.set("n", "<leader>zl", "<cmd>Telekasten insert_link<CR>")
          vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
          vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>")
      end
  },
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
        },
        opts = {},
      },
    },
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets' },
      },

      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
