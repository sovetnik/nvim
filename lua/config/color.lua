vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif

  let g:gruvbox_material_colors_override = {
      \ 'bg_dim':     ['#121212', '233'],
      \ 'bg0':        ['#1c1c1c', '234'],
      \ 'bg1':        ['#2e383c', '235'],
      \ 'bg2':        ['#262626', '236'],
      \ 'bg3':        ['#414b50', '237'],
      \ 'bg4':        ['#495156', '238'],
      \ 'bg5':        ['#4f5b58', '239'],
      \ 'fg0':        ['#ffd700', '220'],
      \ 'fg1':        ['#ffff00', '226'],
      \ 'red':          ['#ff5f00', '202'],
      \ 'orange':       ['#ff8700', '208'],
      \ 'yellow':       ['#d78700', '172'],
      \ 'green':        ['#87d700', '112'],
      \ 'aqua':         ['#87d7ff', '117'],
      \ 'blue':         ['#87afff', '111'],
      \ 'purple':       ['#afd7ff', '153'],
      \ 'bg_red':       ['#d75f00', '166'],
      \ 'bg_green':     ['#afaf00', '142'],
      \ 'bg_yellow':    ['#d7af00', '178']
  \ }

  colorscheme gruvbox-material
]]


-- highlight Comment ctermfg=143 cterm=NONE
-- highlight Search ctermbg=237 ctermfg=190
-- highlight IncSearch ctermbg=237 ctermfg=154 cterm=underline

-- vim.cmd [[
--   hi NeogitNotificationInfo ctermfg=39
--   hi NeogitNotificationWarning ctermfg=178
--   hi NeogitNotificationError ctermfg=196
--   hi NeogitDiffAddHighlight ctermbg=234 ctermfg=46
--   hi NeogitDiffDeleteHighlight ctermbg=234 ctermfg=160
--   hi NeogitDiffContextHighlight ctermbg=234 ctermfg=190
--   hi NeogitDiffContext ctermbg=234 ctermfg=178
--   hi NeogitHunkHeader ctermbg=234 ctermfg=184
--   hi NeogitHunkHeaderHighlight ctermbg=234 ctermfg=154
-- ]]
