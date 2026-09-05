-- lua/plugins/obsidian.lua
return {
  {
      "obsidian-nvim/obsidian.nvim",
      version = "*", -- pin to latest release rather than main
      ft = "markdown",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
      keys = {
        { "<leader>zf", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian: find note" } },
        { "<leader>zg", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian: grep notes" } },
        { "<leader>zb", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian: backlinks" } },
        { "<leader>zt", "<cmd>ObsidianTags<cr>", { desc = "Obsidian: browse tags" } },
        { "<leader>znn", "<cmd>ObsidianNew<cr>", { desc = "Obsidian: new note" } },
        { "<leader>znp", ":ObsidianNew people/", { desc = "Obsidian: new note" } },
        { "<leader>zne", ":ObsidianNew events/", { desc = "Obsidian: new note" } },
        { "<leader>znc", ":ObsidianNew concepts/", { desc = "Obsidian: new note" } },
        { "<leader>zno", ":ObsidianNew orgs/", { desc = "Obsidian: new note" } },
        { "<leader>znt", ":ObsidianNew texts/", { desc = "Obsidian: new note" } },
        { "gf",
          function()
            return require("obsidian").util.gf_passthrough()
          end,
          expr = true,
          desc = "Obsidian: follow link",
        },
      },
      opts = {
        workspaces = {
          { name = "party-notes", path = "/work/rca/roam" },
        },

        -- Zettelkasten-style IDs so files are stable even if you rename titles
        note_id_func = function(title)
          local suffix = ""
          if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return suffix
        end,

        note_frontmatter_func = function(note)
            if note.title then
                note:add_alias(note.title)
            end

            local out = {
                id = note.id,
                aliases = note.aliases,
                tags = note.tags,
            }

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            -- derive type from directory
            local path = tostring(note.path)
            local dir_types = {
              ["/people/"]      = "person",
              ["/texts/"]       = "text",
              ["/concepts/"]    = "concept",
              ["/orgs/"]        = "organization",
              ["/events/"]      = "event",
            }
            for pattern, t in pairs(dir_types) do
              if path:find(pattern, 1, true) then
                out.type = t
                if not vim.tbl_contains(out.tags, t) then
                    table.insert(out.tags, t)
                end
                break
              end
            end

            return out
        end,

        completion = {
          blink = true,
          min_chars = 2,
        },

        picker = {
          name = "telescope.nvim",
        },

        -- turn off obsidian.nvim's own concealing UI since render-markdown.nvim handles that
        ui = { enable = false },

        templates = {
          folder = "templates",
        },
      },
  },
  {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown" },
      dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
      opts = {
        file_types = { "markdown" },
      },
    },
}
