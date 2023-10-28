local colors = require('../colors/golden_brown')

vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif
]]

-- some colors seems unused, so it set to white to find them
require('base16-colorscheme').setup({
  -- main bg
  base00 = colors.black,
  -- commit hash
  base01 = colors.gray,
  -- telescope-input-field-bg
  base02 = colors.darkgray,
  -- start-empty-quit comment
  base03 = colors.lightgray,
  -- linenum saved blue
  base04 = colors.blue,
  -- packer %{} |> = tree filename git-unchanged html text
  base05 = colors.gold,
  -- unused?
  base06 = '#ffffff',
  base07 = '#ffffff',
  -- start-filename div variable git-deleted
  base08 = colors.red,
  -- startify-choice  @var num bool
  base09 = colors.cyan,
  -- constant
  base0A = colors.brown,
  -- text string
  base0B = colors.green,
  -- unused?
  base0C = '#ffffff',
  -- path method git-head gold
  base0D = colors.orange,
  -- def do end
  base0E = colors.darkorange,
  -- html brackets, commas start-cow
  base0F = colors.yellow,
})

-- Global colors
vim.api.nvim_set_hl(0, 'Search', { fg = colors.magenta, bg = colors.darkgray, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { fg = colors.gold, bg = colors.gray, bold = true })

--  Telescope common
vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = colors.gold, bg = colors.black })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = colors.orange, bg = colors.darkgray, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = colors.orange, bg = colors.darkgray, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.green, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = colors.cyan, bg = colors.darkgray, bold = true })

--  Telescope Title highlight groups
vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = colors.cyan, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.cyan, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.brown, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.orange, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.blue, bg = colors.darkgray })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = colors.blue, bg = colors.darkgray })

-- Border highlight groups
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = colors.cyan, bg = colors.black })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.cyan, bg = colors.black })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = colors.blue, bg = colors.black })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.blue, bg = colors.black })
