require 'plugins'

vim.cmd [[ :PackerUpdate ]]

require 'config.absolute'
require 'config.completion'
require 'config.elixir'
require 'config.gitsign'
require 'config.lsp'
require 'config.neogit'
require 'config.neotest'
require 'config.signature'
require 'config.statusline'
require 'config.telescope'
require 'config.tree'
require 'config.treesitter'
require 'mappings.core'
require 'mappings.leader'

vim.cmd [[
  syntax enable
  colorscheme moonshine
  highlight Comment ctermfg=143 cterm=NONE
  highlight Search ctermbg=237 ctermfg=190
  highlight IncSearch ctermbg=237 ctermfg=154 cterm=underline
  au BufWritePost *.ex,*.exs,*.heex,*.lua lua vim.lsp.buf.format()
  au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}
]]

vim.cmd [[
  hi NeogitNotificationInfo ctermfg=39
  hi NeogitNotificationWarning ctermfg=178
  hi NeogitNotificationError ctermfg=196
  hi NeogitDiffAddHighlight ctermbg=234 ctermfg=46
  hi NeogitDiffDeleteHighlight ctermbg=234 ctermfg=160
  hi NeogitDiffContextHighlight ctermbg=234 ctermfg=190
  hi NeogitDiffContext ctermbg=234 ctermfg=178
  hi NeogitHunkHeader ctermbg=234 ctermfg=184
  hi NeogitHunkHeaderHighlight ctermbg=234 ctermfg=154
]]
