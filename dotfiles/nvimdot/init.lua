require("options")
require("keymaps")
require("autocmds")
require("lsp")

-- custom func to load plugin
_G.load_plugin = function(spec)
  local plugins = spec[1] and spec or { spec }

  -- 1. PRE-LOAD: Run all 'init' functions for vim.g settings
  for _, plugin in ipairs(plugins) do
    if type(plugin.init) == "function" then
      plugin.init()
    end
  end

  -- 2. LOAD: Pass the entire list to Neovim's package manager
  vim.pack.add(plugins)

  -- 3. POST-LOAD: Run all 'config' functions for setup() settings
  for _, plugin in ipairs(plugins) do
    if type(plugin.config) == "function" then
      plugin.config()
    end
  end
end
