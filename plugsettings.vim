" -----------------------------------------------------
" Common Settings {{{
" -----------------------------------------------------
"  Netrw
let g:netrw_altv          = 1
let g:netrw_dirhistmax   = 100
let g:netrw_fastbrowse    = 3
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
let g:netrw_special_syntax= 1

" Nerdtree
" enable line numbers
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=0
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 60
let NERDTreeWinPos = 'right'
let NERDTreeAutoDeleteBuffer = 1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Open fugitive gitdiff in vertical split
set diffopt+=vertical

" CtrlSF settings
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'

"}}}

" -----------------------------------------------------
"  Asynchronous Lint Engine settings {{{
" -----------------------------------------------------
"  defaults for autocomplete
set completeopt=menu,menuone,preview,noselect,noinsert

" let g:ale_linters = {
"       \   'javascript': ['eslint', 'prettier'],
"       \}

let g:ale_fixers = {
      \   'javascript': [
      \       'eslint', 
      \       'prettier'
      \   ],
      \   'markdown': [
      \       'prettier',
      \       'textlint',
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   'ruby': [
      \       'rubocop',
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   'slim': [
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   'sql': [
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   'vue': [
      \       'eslint', 
      \       'prettier'
      \   ],
      \   'yaml': [
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \}

let g:ale_sign_error = '❯❯'
let g:ale_sign_warning = '❯'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
"}}}

" -----------------------------------------------------
" Buffergator settings {{{
" -----------------------------------------------------
let g:buffergator_sort_regime = 'mru'
let g:buffergator_viewport_split_policy = 'L'
let g:buffergator_autoupdate = 1
let g:buffergator_show_full_directory_path = 0
let g:buffergator_suppress_keymaps = 1
let g:buffergator_hsplit_size = 30
let g:buffergator_vsplit_size = 50
"}}}

" -----------------------------------------------------
" Deoplete autocomplete settings {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
call deoplete#custom#option('refresh_always', v:false)
call deoplete#custom#source('_', 'buffer', 'file', 'ultisnips')
call deoplete#custom#source('ruby', 'buffer', 'member', 'file', 'ultisnips')
call deoplete#custom#source('vim', 'buffer', 'member', 'file', 'ultisnips')
" }}}

" -----------------------------------------------------
" Snippets {{{
" -----------------------------------------------------
" }}}

" -----------------------------------------------------
"  Closetag(HTML) settings {{{
" -----------------------------------------------------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,vue'
