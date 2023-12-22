local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close },
    },
  }
}

telescope.load_extension('fzf')
