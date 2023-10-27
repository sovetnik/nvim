require('base16-colorscheme').setup({
  base00 = '#1c1c1c', -- main bg
  base01 = '#3a3a3a', -- telescope title & commit hash make it lite blue
  base02 = '#262626', -- telescope-input-field-bg
  base03 = '#87d7ff', -- start-empty-quit comment aqua ?
  base04 = '#87afff', --   linenum saved blue ! correct
  base05 = '#ffd700', --packer %{} |> = tree filename git-unchanged html text bg yellow ! make it brighter 178
  base06 = '#ff0000', --light gray unused?
  base07 = '#ffffff', --  unused?
  base08 = '#ff5f00', -- start-filename div variable git deleted should be red ! correct
  base09 = '#afd7ff', -- startify-choice  @var num bool purple ! correct
  base0A = '#d78700', --bronze constant yellow ! correct
  base0B = '#87d700', --green! correct
  base0C = '#ff0000', -- seagreen? unused?
  base0D = '#ffaf00', -- path  method git-head gold fg0
  base0E = '#ff8700', --def do end orange ! correct
  base0F = '#ffff00', -- html brackets, commas start-cow ! Make brighter! fg1
})

-- highlight Comment ctermfg=143 cterm=NONE
vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif

  set incsearch
  highlight Search guibg=#262626 guifg=#ff87ff gui=underline
  highlight Visual  guifg=#ffd700 guibg=#444444

  highlight TelescopeNormal         guibg=#1c1c1c          " Floating window bg
  highlight TelescopeSelection      guifg=#87d7ff gui=bold " Selected item
  highlight TelescopeSelectionCaret guifg=#ff8700          " Selection caret
  highlight TelescopeMultiSelection guifg=#ff8700          " Multisections

  " Title highlight groups 262626
  highlight TelescopeTitle          guibg=#262626 guifg=#87d7ff
  highlight TelescopePromptTitle    guibg=#262626 guifg=#87d7ff
  highlight TelescopePromptCounter  guibg=#262626 guifg=#ff8700
  highlight TelescopeResultsTitle   guibg=#262626 guifg=#87afff
  highlight TelescopePreviewTitle   guibg=#262626 guifg=#87afff

  " Border highlight groups
  highlight TelescopeBorder         guifg=#87d7ff
  highlight TelescopePromptBorder   guifg=#87d7ff
  highlight TelescopeResultsBorder  guifg=#87afff
  highlight TelescopePreviewBorder  guifg=#87afff

  " Highlight characters your input matches
  highlight TelescopeMatching       guifg=#87afff

  " Color the prompt prefix
  highlight TelescopePromptPrefix   guifg=#ff8700
]]

-- vim.cmd [[
--   if has('termguicolors')
--     set termguicolors
--   endif

--   let g:gruvbox_material_colors_override = {
--       \ 'bg_dim':     ['#121212', '233'],
--       \ 'bg0':        ['#1c1c1c', '234'],
--       \ 'bg1':        ['#2e383c', '235'],
--       \ 'bg2':        ['#262626', '236'],
--       \ 'bg3':        ['#414b50', '237'],
--       \ 'bg4':        ['#495156', '238'],
--       \ 'bg5':        ['#4f5b58', '239'],
--       \ 'fg0':        ['#ffd700', '220'],
--       \ 'fg1':        ['#ffff00', '226'],
--       \ 'red':          ['#ff5f00', '202'],
--       \ 'orange':       ['#ff8700', '208'],
--       \ 'yellow':       ['#d78700', '172'],
--       \ 'green':        ['#87d700', '112'],
--       \ 'aqua':         ['#87d7ff', '117'],
--       \ 'blue':         ['#87afff', '111'],
--       \ 'purple':       ['#afd7ff', '153'],
--       \ 'bg_red':       ['#d75f00', '166'],
--       \ 'bg_green':     ['#afaf00', '142'],
--       \ 'bg_yellow':    ['#d7ff00', '178']
--   \ }

--   colorscheme gruvbox-material
-- ]]
