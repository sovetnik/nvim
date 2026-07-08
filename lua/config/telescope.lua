local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close },
    },
  },
  extensions = {
    cmdline = {
      -- Adjust telescope picker size and layout
      picker   = {
        layout_config = {
          width  = 120,
          height = 25,
        }
      },
      -- Adjust your mappings
      mappings = {
        complete      = '<Tab>',
        run_selection = '<C-CR>',
        run_input     = '<CR>',
      },
      -- Triggers any shell command using overseer.nvim (`:!`)
      overseer = {
        enabled = true,
      },
    },
  },
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                   -- false will only do exact matching
  --     override_generic_sorter = true, -- override the generic sorter
  --     override_file_sorter = true,    -- override the file sorter
  --     case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
  --     -- the default case_mode is "smart_case"
  --   }
  -- }
}
-- telescope.load_extension('fzf')
