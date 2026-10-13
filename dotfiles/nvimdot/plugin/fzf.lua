local config = function()
  local mapkey = require("utils").mapkey

  mapkey("<leader>ff", function()
    require("fzf-lua").files()
  end, "n", { desc = "Fuzzy find files" })

  mapkey("<leader>fg", function()
    require("fzf-lua").live_grep()
  end, "n", { desc = "Fuzzy grep files" })

  mapkey("<leader>fb", function()
    require("fzf-lua").buffers()
  end, "n", { desc = "Fuzzy find buffers" })

  require("fzf-lua").setup({
    "ivy",
    winopts = {
      backdrop = false,
      width = 1, -- window width
      preview = {
        hidden = true,
        vertical = "up:70%",
      },
    },
    keymap = {
      builtin = {
        ["<TAB>"] = "toggle-preview",
        ["<C-f>"] = "preview-page-down",
        ["<C-d>"] = "preview-page-up",
      },
    },
    fzf_opts = {
      ["--cycle"] = "",
      ["--border"] = "none",
    },
  })

  require("fzf-lua").register_ui_select()
end

load_plugin({
  src = "https://github.com/ibhagwan/fzf-lua",
  -- -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = config,
})
