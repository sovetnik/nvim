-- config/companion.lua

require("codecompanion").setup({
  adapters = {
    codellama = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "codellama", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "codellama:34b",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,

    gemma = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "gemma", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "codegemma",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,

    phi = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "phi", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "phi4:latest",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
  display = {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
      provider = "telescope",               -- default|telescope|mini_pick
      opts = {
        show_default_actions = true,        -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },
  },
  -- disabled_adapters = { "copilot" },
  strategies = {
    chat = {
      adapter = "phi",
    },
    inline = {
      adapter = "phi",
    },
  },
})
