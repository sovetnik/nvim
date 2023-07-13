-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  gray     = '#3C3C3C',
  darkgray = '#3c3836',
  yellow   = '#cae682',
  orange   = '#fe8019',
  red      = '#df0000',
  magenta  = '#f2c68a',
  blue     = '#8ac6f2',
  cyan     = '#8ac6f2',
  green    = '#95e454',
  black    = '#262626',
}

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
    a = { fg = colors.darkgray, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = colors.gray },
    c = { fg = colors.yellow, bg = colors.black },
  },

  insert = { a = { fg = colors.darkgray, bg = colors.green } },
  visual = { a = { fg = colors.darkgray, bg = colors.cyan } },
  replace = { a = { fg = colors.darkgray, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.darkgray },
    b = { fg = colors.blue, bg = colors.gray },
    c = { fg = colors.gray, bg = colors.darkgray },
  },
}

local function lsp_name()
  local msg = 'No'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
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
          added = { fg = 28 },
          modified = { fg = 178 },
          removed = { fg = 160 },
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
