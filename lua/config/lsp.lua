require("mason").setup({ PATH = "append" })
require("mason-lspconfig").setup({
  ensure_installed = { "elixirls", "lua_ls" },
})

-- Mason puts shims in: stdpath("data") .. "/mason/bin"
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
-- Принудительно кладём Mason/bin в начало PATH (чтобы brew не перехватывал)
if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
  vim.env.PATH = mason_bin .. ":" .. (vim.env.PATH or "")
end

-- ----- ElixirLS -----
-- Разрешаем команду через Mason shim, fallback на PATH
local elixirls_cmd = mason_bin .. "/elixir-ls"
if vim.fn.executable(elixirls_cmd) ~= 1 then
  elixirls_cmd = "elixir-ls"
end


vim.lsp.config('elixirls', {
  cmd = { elixirls_cmd },
  settings = {
    elixirLS = {
      dialyzerEnabled = false, -- на время — быстрее цикл
      fetchDeps = false,
    },
  },
})

-- ----- Lua LS -----
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Включаем конфиги. Можно списком.
vim.lsp.enable({ 'elixirls', 'lua_ls', 'ruby_lsp', 'rubocop' })

-- Опционально: lsp_signature (оставляю как у тебя)
require('lsp_signature').setup({
  bind = true,
  handler_opts = { border = "rounded" },
})

-- ===== Диагностика и хоткеи =====
-- Глобальные хоткеи диагностик
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
end, { desc = "Go to previous diagnostic" })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Буферные хоткеи — только после attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Если надо включить virtual_text:
-- vim.diagnostic.config({ virtual_text = true })
