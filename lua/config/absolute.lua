vim.api.nvim_set_option('smarttab', false)

-- set main language
-- language en_US

-- change the terminal's title
vim.o.title = true
vim.o.title = true

-- Absolute number for active line, relative for others
vim.o.number = true

vim.o.relativenumber = true

-- Show incomplete cmds down the bottom
vim.o.showcmd = true

-- Smart case search if there is uppercase
vim.o.smartcase = true

-- Case insensitive search
vim.o.ignorecase = true

-- Long line break by words
vim.o.linebreak = true

-- Use spaces instead tabs
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2


-- Re-reads file if changed otuside of vim but not in vim
vim.o.autoread = true

-- Write buffer when focus lost by any reason
-- (when not set, possible situation, when some unsaved changes prevent autoread )
vim.o.autowriteall = true

-- write backup before overwriting file, and remove if successfully written
vim.o.nobackup = true
vim.o.noswapfile = true
vim.o.writebackup = true

-- Start scrolling when we're 7 lines away from margins
vim.o.scrolloff = 7

-- Use a system clipboard
vim.o.clipboard = 'unnamed'

-- This allows buffers to be hidden if you've modified a buffer.
-- This is almost a must if you wish to use buffers in this way.
vim.o.hidden = true

-- Live substitution
vim.o.inccommand = 'nosplit'

-- Remove Perl from healthcheck
vim.g.loaded_perl_provider = 0
