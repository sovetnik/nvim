# NeoVIM config

Simple and minimalistic lua neovim config from 2023 for elixir efficient development, 
mostly commented and separated by files.

# Installation

    $ cd ~/.config
    $ git clone git@github.com:sovetnik/nvim.git

  Open VIM two times after that: 
  - to install all plugins
  - to install treesitter parsers

## Install treesitter languages

  :TSInstall elixir
  or any of
  :TSInstallInfo

## Language server

  Create .tool-versions (elixir 15.x currently unsupported by LS, so choose 14.5)
  $ asdf install
  $ brew install elixir-ls

## Telescope backend

  $ brew install ripgrep

# Features

## Packer for plugins
Autoupdate on enter VIM

## Autocompletion from language server

  Provided by nvim-cmp
  `<Tab>` - next suggestion
  `<S-Tab>` - prev suggestion
  `<CR>(Enter)` - complete with first or selected item

## Formatting on sawe

  Provided by `vim.lsp.buf.format()`

## File browser: nvim-tree

  `<leader><leader>` toggles the tree

  `:NvimTreeToggle` Open or close the tree. Takes an optional path argument.

  `:NvimTreeFocus` Open the tree if it is closed, and then focus on the tree.

  `:NvimTreeFindFile` Move the cursor in the tree for the current buffer, opening folders if needed.

  `:NvimTreeCollapse` Collapses the nvim-tree recursively.

## File finder: telescope

  `<leader>b` - from open bufers
  `<leader>n` - find files
  `\` - grep

## Git commands

  `<leader>h` - Show diff of hunk under cursor
  or `:Gitsigns preview_hunk_inline`

  Show list of changes in QF list
    `:Gitsigns setqflist`
    or click gitstats

  Also hunk navigation
    `]h` - next_hunk
    `[h` - prev_hunk

  And stage / unstage functions
    `:Gitsigns stage_buffer`
    `:Gitsigns stage_hunk`
    `:h map ;h`


## Projectionist navigation

  `<leader>a` - Switches between code and test, 
      opens alternate in vertiocal split if not yet 
      and prompts for creating if alternate files not found

## Git status and LSP diagnostics; QF and LC

  `<leader>s` - Git hunks of buffer in LocList
  `<leader>d` - Diagnostics info of buffer in LocList
  `<leader>c` - Close LocList
  `<leader>cc` - Close QuickFix

## Run test suite

  `<leader>r` - Neotest result panel toggle (list like qiuckfix)
  `<leader>t` - Neotest watch file toggle (run tests)
  `<leader>y` - Neotest summary toggle (test tree view)

## Swap current and last buffers
  `<leader>z` - Swap buffers

## Signature of elixir method

  Signature help on cursor when edit caller

## Statusline

  Shows git diff, attached language server 
  and warns count (open qiuckfix on click)

## Powerline patched font for using icons

  https://github.com/powerline/fonts

## Mappings

  `:map` will show all mappings

## How to use?

  It strongly recommended to read all readme for plugins in `lua/plugins.lua`
