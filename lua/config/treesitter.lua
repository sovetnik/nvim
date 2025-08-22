require 'nvim-treesitter.configs'.setup {

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "elixir", "lua", "vim", "vimdoc", "query", "html", "markdown_inline" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,
  -- ignore_install = {},

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  modules = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.ex", "*.exs" },
--   callback = function()
--     vim.cmd("TSBufEnable highlight")
--   end,
-- })
