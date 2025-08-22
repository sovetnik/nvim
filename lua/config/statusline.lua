-- this colors the same as for colorscheme
local colors = require('../colors/golden_brown')

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,

}
local my_theme = {
  normal = {
    a = { fg = colors.darkgray, bg = colors.brown, gui = 'bold' },
    b = { fg = colors.gold, bg = colors.gray },
    c = { fg = colors.yellow, bg = colors.darkgray },
  },

  insert = {
    a = { fg = colors.darkgray, bg = colors.green, gui = 'bold'
    }
  },
  visual = {
    a = { fg = colors.darkgray, bg = colors.orange, gui = 'bold' }
  },
  replace = {
    a = { fg = colors.darkgray, bg = colors.red, gui = 'bold' }
  },

  inactive = {
    a = { fg = colors.orange, bg = colors.darkgray },
    b = { fg = colors.blue, bg = colors.darkgray },
    c = { fg = colors.orange, bg = colors.gray },
  },
}

local function lsp_name()
  local msg = 'No'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  print(msg)
  return msg
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require('lualine').setup {
  options = {
    theme = my_theme,
    section_separators = { left = nil, right = nil },
    component_separators = { left = '/', right = '\\' },
  },
  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
      { 'mode', right_padding = 2 },
    },
    lualine_b = {
      'filename',
      { 'b:gitsigns_head', icon = '' },
    },
    lualine_c = {
      {
        'diff',
        icon = ' ',
        symbols = { added = '+', modified = '~', removed = '-' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.gold },
          removed = { fg = colors.red },
        },
        source = diff_source,
        cond = conditions.hide_in_width,
        on_click = function()
          package.loaded.gitsigns.setloclist()
        end,
      }
    },
    lualine_x = {
      'filetype',
      { lsp_name, icon = '󰗊 ' },
    },
    lualine_y = {
      {
        'diagnostics',
        sources = { 'nvim_lsp', 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
        on_click = function()
          vim.diagnostic.setloclist()
        end,
      },
      {
        'o:encoding',       -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
      },
      { 'fileformat', },
      { 'progress', },
    },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
  tabline = {},
  extensions = {},
}
