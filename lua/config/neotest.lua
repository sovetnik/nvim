require("neotest").setup({
  adapters = {
    require("neotest-elixir"),
    require("neotest-rspec"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
