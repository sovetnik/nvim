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
  base09 = colors.blue,
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

-- Diagnostic highlights
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = colors.black })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = colors.red, bg = colors.black })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.orange, bg = colors.black })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = colors.orange, bg = colors.black })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.cyan, bg = colors.black })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = colors.cyan, bg = colors.black })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.blue, bg = colors.black })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = colors.blue, bg = colors.black })

-- Elixir treesitter colors
vim.api.nvim_set_hl(0, '@spell.markdown', { fg = colors.orange, bg = colors.black })
vim.api.nvim_set_hl(0, '@module.elixir', { fg = colors.brown, bg = colors.black })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.green, bg = colors.black })
vim.api.nvim_set_hl(0, 'TSString', { fg = colors.cyan, bg = colors.black })

-- Global colors
vim.api.nvim_set_hl(0, 'Search', { fg = colors.magenta, bg = colors.darkgray, bold = true })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.gray, bg = colors.darkgray })
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

-- -- Устанавливаем цвета для git-значков в nvim-tree
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = colors.green, bg = colors.black })        -- untracked
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = colors.darkorange, bg = colors.black }) -- unstaged
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = colors.red, bg = colors.black })      -- deleted
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = colors.blue, bg = colors.black })     -- deleted
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = colors.blue, bg = colors.black })         -- deleted
-- vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { fg = colors.blue, bg = colors.black })       -- deleted
