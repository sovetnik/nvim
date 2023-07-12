require('gitsigns').setup {
  signs                        = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn                   = false, -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = false
  },
  on_attach                    = function(bufnr)
    -- highlight GitSignsDeleteLn ctermbg=234 ctermfg=190
    -- highlight GitSignsDeleteVirtLnInLine ctermbg=232 ctermfg=201 cterm=underline
    -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'None' })
    vim.cmd [[
      highlight GitSignsAdd ctermbg=234 ctermfg=34
      highlight GitSignsChange ctermbg=234 ctermfg=178
      highlight GitSignsDelete ctermbg=234 ctermfg=160

      highlight GitSignsUntrackedNr ctermbg=232 ctermfg=68

      " Inline diff
      highlight DiffAdd ctermbg=234 ctermfg=46
      highlight GitSignsChangeInline ctermbg=238 ctermfg=226 cterm=underline
      highlight GitSignsDeleteVirtLn ctermbg=234 ctermfg=160

      " Inline added word
      highlight GitSignsAddPreview ctermbg=232 ctermfg=34
      highlight GitSignsAddInline ctermbg=232 ctermfg=154 cterm=underline

      " Inline deleted line
      highlight GitSignsDeletePreview ctermbg=232 ctermfg=160
      " Inline deleted word in line
      highlight GitSignsDeleteInline ctermbg=233 ctermfg=196 cterm=underline

    ]]

    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[h', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    local function opts(desc)
      return { noremap = true, silent = true, desc = desc }
    end
    -- Actions
    map('n', '<leader>h', gs.preview_hunk, opts('Hunk show'))
    map('n', '<leader>hs', gs.stage_hunk, opts('Hunk stage'))
    map('n', '<leader>hr', gs.reset_hunk, opts('Hunk reset'))
    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts('Hunk stage visual'))
    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts('Hunk reset visual'))
    map('n', '<leader>hS', gs.stage_buffer, opts('Stage buffer'))
    map('n', '<leader>hu', gs.undo_stage_hunk, opts('Hunk undo stage'))
    map('n', '<leader>hR', gs.reset_buffer, opts('Reset buffer'))
    map('n', '<leader>hi', gs.preview_hunk_inline, opts('Hunk preview inline'))
    map('n', '<leader>hb', function() gs.blame_line { full = true } end, opts('Blame line'))
    map('n', '<leader>tb', gs.toggle_current_line_blame, opts('Blame toggle'))
    map('n', '<leader>hd', gs.diffthis, opts('Hunk Diffthis'))
    map('n', '<leader>hD', function() gs.diffthis('~') end, opts('Hunk '))
    map('n', '<leader>td', gs.toggle_deleted, opts('Hunk '))

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end

}
