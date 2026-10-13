local init = function()
  vim.g.guard_config = {
    -- format on write to buffer
    fmt_on_save = false,
    -- use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- whether or not to save the buffer after formatting
    save_on_fmt = true,
    -- automatic linting
    auto_lint = true,
    -- how frequently can linters be called
    lint_interval = 500,
    -- show diagnostic after format done
    refresh_diagnostic = true,
  }
end

local config = function()
  local mapkey = require("utils").mapkey

  mapkey("<leader>af", function()
    require("guard.api").fmt()
  end, "n", { desc = "Format file" })

  local ft = require("guard.filetype")

  ft("lua"):fmt("stylua")
  ft("rust"):fmt("rustfmt")
  ft("c"):fmt("clang-format")
end

load_plugin({
  {
    src = "https://github.com/nvimdev/guard-collection",
  },
  {
    src = "https://github.com/nvimdev/guard.nvim",
    init = init,
    config = config,
  },
})
