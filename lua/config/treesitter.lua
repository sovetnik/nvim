local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

treesitter.setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- parser name -> filetype(s) that should trigger highlighting/install
local parsers = {
  elixir = { "elixir" },
  lua = { "lua" },
  vim = { "vim" },
  vimdoc = { "help" },
  query = { "query" },
  html = { "html" },
  markdown_inline = { "markdown" },
}

local ensure_installed = vim.tbl_keys(parsers)
local installed = require("nvim-treesitter.config").get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang)
end, ensure_installed)

if #missing > 0 then
  treesitter.install(missing)
end

local filetypes = {}
for _, fts in pairs(parsers) do
  vim.list_extend(filetypes, fts)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
  end,
})
