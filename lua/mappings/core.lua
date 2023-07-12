--
-- Vim defaults overriding

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end
--
-- Disabling arrow keys, space key, exmode enter
-- with Q key, help with F1, etc.
--
vim.api.nvim_set_keymap('n', '<up>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', '<down>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', '<left>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', '<right>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', '<delete>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', '<space>', '', opts('Disable key'))
vim.api.nvim_set_keymap('n', 'Q', '', opts('Disable key'))
-- inoremap <F1> <NOP>
-- nnoremap <F1> <NOP>


-- Easier window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts('Move focus right'))
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts('Move focus down'))
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts('Move focus up'))
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts('Move focus left'))

-- Exit from Insert mode (additional esc)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', opts('Escape with jk'))

-- More logical Y (default was alias for yy)
vim.api.nvim_set_keymap('n', 'Y', 'y$', opts('Yank to the end of line'))
-- nnoremap Y y$

-- Don't yank to default register when changing something
vim.api.nvim_set_keymap('n', 'c', '"xc', opts('Change w/o update default register'))
vim.api.nvim_set_keymap('x', 'c', '"xc', opts('Cut w/o update default register'))

-- Fix the cw at the end of line bug default vim has special treatment (:help cw)
vim.api.nvim_set_keymap('n', 'cw', 'ce', opts('CE instead of CW'))
vim.api.nvim_set_keymap('n', 'dw', 'de', opts('DE instead of DW'))

-- Uppercase word in insert mode
vim.api.nvim_set_keymap('i', '<C-u>', '<ESC>mzgUiw`za', opts('Uppercase in Insert'))

-- Don't cancel visual select when shifting
vim.api.nvim_set_keymap('x', '<', '<gv', opts('Shift visual left'))
vim.api.nvim_set_keymap('x', '>', '>gv', opts('Shift visual right'))

-- Keep the cursor in place while joining lines
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts('Join this and next lines'))

-- [S]plit line (sister to [J]oin lines) S is covered by cc.
vim.api.nvim_set_keymap('n', 'S', 'mzi<CR><ESC>`z', opts('Split line under the cursor'))

-- Remove highlight after find
vim.api.nvim_set_keymap('n', '//', ':nohlsearch<CR>', opts('Remove highlight'))
