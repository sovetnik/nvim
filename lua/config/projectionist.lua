local new_heuristics = {
  ["Gemfile"] = {
    ["app/**/*.rb"] = {
      type = "source",
      alternate = "spec/{}_spec.rb",
      template = {
        "require 'rails_helper'",
        "",
        "RSpec.describe <%= projectionist#classify(expand('%:t:r')) %> do",
        "  it 'does something' do",
        "    expect(true).to be(true)",
        "  end",
        "end"
      }
    },
    ["lib/**/*.rb"] = {
      type = "source",
      alternate = "spec/{}_spec.rb",
      template = {
        "require 'rails_helper'",
        "",
        "RSpec.describe <%= projectionist#classify(expand('%:t:r')) %> do",
        "  it 'does something' do",
        "    expect(true).to be(true)",
        "  end",
        "end"
      }
    },
    ["spec/**/*_spec.rb"] = {
      type = "test",
      alternate = "{}.rb"
    }
  }
}

local function merge_tables(orig, new)
  for key, value in pairs(new) do
    if type(value) == "table" and type(orig[key]) == "table" then
      merge_tables(orig[key], value)
    else
      orig[key] = value
    end
  end
end

vim.g.projectionist_heuristics = vim.g.projectionist_heuristics or {}
merge_tables(vim.g.projectionist_heuristics, new_heuristics)
