local elixir = require("elixir")
-- local elixirls = require("elixir.elixirls")

elixir.setup({
  nextls = { enable = false },
  credo = { enable = false },
  elixirls = {
    tag = "v0.20.0",
    -- cmd = "/opt/homebrew/Cellar/elixir-ls/0.20.0/libexec/launch.sh",
    -- settings = elixirls.settings {
    --   dialyzerEnabled = true,
    --   fetchDeps = false,
    --   enableTestLenses = false,
    --   suggestSpecs = false,
    -- },
    on_attach = function(client, _bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
})
