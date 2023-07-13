--
-- Setting leader mappings
--
vim.g.mapleader = ';'

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Test toggle
vim.api.nvim_set_keymap('n', '<leader>a', ':AV<CR>', opts('Alternate file'))

-- Git hunks of buffer in LocList
vim.keymap.set('n', '<leader>s', "<cmd>lua package.loaded.gitsigns.setloclist()<cr>", opts('Hunks in LocList'))
-- vim.keymap.set('n', '<leader>s', package.loaded.gitsigns.setloclist(), opts('Hunks inn LocList'))
-- Diagnostics info of buffer in LocList
vim.keymap.set('n', '<leader>d', "<cmd>lua vim.diagnostic.setloclist()<cr>", opts(' Diagnostics in LocList'))

-- Tree toggle
vim.api.nvim_set_keymap('n', '<leader><leader>', ':NvimTreeFindFile<CR>', opts('Toggle Tree'))

--
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>n', builtin.find_files, opts('Telescope: find files'))
vim.keymap.set('n', '\\', builtin.live_grep, opts('Telescope: grep files'))
vim.keymap.set('n', '<leader>b', builtin.buffers, opts('Telescope: list buffers'))

----
---- Signature help
--vim.keymap.set('n', '<leader>h', "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts('Show signature'))

-- Close quickfix menu
vim.api.nvim_set_keymap('n', '<leader>c', ':lclose<CR>', opts('LocList close not focused'))
vim.api.nvim_set_keymap('n', '<leader>cc', ':cclose<CR>', opts('QF close not focused'))

-- Open vertical split
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', opts('Vertical split copy of this buffer'))

-- Quick write buffer
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts('Quick write buffer'))

-- Quick quit buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts('Quick quit buffer'))

-- Re-edit file from buffer
vim.api.nvim_set_keymap('n', '<leader>e', ':e<CR>', opts('Re-edit file from buffer'))

-- Start search on current word under the cursor
vim.api.nvim_set_keymap('n', '<leader>/', '/<CR>', opts('Highlight and search'))

-- Start reverse search on current word under the cursor
vim.api.nvim_set_keymap('n', '<leader>?', '?<CR>', opts('Highlight and search back'))


----
---- --  Vim test
local neotest = require("neotest")

-- Toggle panel
vim.keymap.set('n', '<leader>r', neotest.output_panel.toggle, opts('Toggle test panel'))

-- vim.keymap.set('n', '<leader>r', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
vim.keymap.set('n', '<leader>t', "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
  opts(' Toggle Watch this test'))

-- Toggle summary
vim.keymap.set('n', '<leader>y', neotest.summary.toggle, opts(' Toggle test summary'))

-- Refactor it someday to local function
function WinBufSwap()
  local thiswin = vim.fn.winnr()
  local thisbuf = vim.fn.bufnr("%")
  local lastwin = vim.fn.winnr("#")
  local lastbuf = vim.fn.winbufnr(lastwin)

  vim.cmd(lastwin .. " wincmd w" .. "|" ..
    "buffer " .. thisbuf .. "|" ..
    thiswin .. " wincmd w" .. "|" ..
    "buffer " .. lastbuf)
end

vim.api.nvim_set_keymap("n", "<Leader>z", "<cmd>lua WinBufSwap()<CR>", opts(' Swap current and last buffers'))
