-- config/companion.lua

require("codecompanion").setup({
  adapters = {
    http = {
      codellama = function()
        return require("codecompanion.adapters.http").extend("ollama", {
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

      -- OpenRouter via OpenAI-compatible adapter
      openrouter = function()
        return require("codecompanion.adapters.http").extend("openai_compatible", {
          name = "openrouter",
          env = {
            api_key = "OPENROUTER_API_KEY",
            url = "https://openrouter.ai/api",
            chat_url = "/v1/chat/completions",
            models_endpoint = "/v1/models",
          },
          headers = {
            ["Content-Type"] = "application/json",
            Authorization = "Bearer ${api_key}",
            -- Optionally uncomment to satisfy OpenRouter best practices:
            -- ["HTTP-Referer"] = "https://your.domain.or.repo",
            -- ["X-Title"] = "Neovim CodeCompanion",
          },
          schema = {
            model = {
              -- Pick a sensible default; change to your preferred OpenRouter model
              default = "openrouter/auto",
            },
          },
        })
      end,
    },
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
      adapter = "openrouter",
    },
    inline = {
      adapter = "openrouter",
    },
  },
})
