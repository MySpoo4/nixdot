vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    vim.keymap.set("n", "gR", function()
      vim.lsp.buf.lsp_references()
    end, { buffer = bufnr, remap = false, desc = "View references" })

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, { buffer = bufnr, remap = false, desc = "Goto definition" })

    vim.keymap.set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, { buffer = bufnr, remap = false, desc = "Goto declaration" })

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
        max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
      })
    end, { buffer = bufnr, remap = false, desc = "View documentation" })
  end,
})

-- local on_attach = function(client, bufnr)
--   vim.print("help ME PLS")
--
-- 	vim.lsp.completion.enable(true, client.id, bufnr, {
-- 		autotrigger = true,
-- 	})
--
-- 	vim.keymap.set("n", "gR", function()
--     vim.lsp.buf.lsp_references()
-- 	end, { buffer = bufnr, remap = false, desc = "View references" })
--
-- 	vim.keymap.set("n", "gd",
-- 	  vim.lsp.buf.definition
-- , { buffer = bufnr, remap = false, desc = "Goto definition" })
--
-- 	vim.keymap.set("n", "gD", function()
-- 	  vim.lsp.buf.declaration()
-- 	end, { buffer = bufnr, remap = false, desc = "Goto declaration" })
--
-- 	vim.keymap.set("n", "K", function()
-- 	  vim.lsp.buf.hover({
-- 	    max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
-- 	    max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
-- 	  })
-- 	end, { buffer = bufnr, remap = false, desc = "View documentation" })
--
-- 	-- vim.keymap.set("n", "<leader>ca", function()
-- 	--   vim.lsp.buf.code_action()
-- 	-- end, { buffer = bufnr, remap = false, desc = "View code actions" })
-- 	--
-- 	-- vim.keymap.set("n", "ge", function()
-- 	--   vim.diagnostic.jump({ count = 1 })
-- 	-- end, { buffer = bufnr, remap = false, desc = "Goto next error" })
-- 	--
-- 	-- vim.keymap.set("n", "gE", function()
-- 	--   vim.diagnostic.jump({ count = -1 })
-- 	-- end, { buffer = bufnr, remap = false, desc = "Goto prev error" })
--
-- 	-- vim.keymap.set("n", "<leader>vd", function()
-- 	--   vim.diagnostic.open_float({
-- 	--     max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
-- 	--     max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
-- 	--   })
-- 	-- end, { buffer = bufnr, remap = false, desc = "View diagnostics" })
-- 	--
-- 	-- vim.keymap.set("n", "<leader>vh", function()
-- 	--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- 	-- end, { buffer = bufnr, remap = false, desc = "Toggle inlay hints" })
-- end
--
-- vim.lsp.config("*", {
-- 	on_attach = on_attach,
-- })

-- TODO maybe stick with default bindings

vim.lsp.enable({
  "rust_analyzer",
  "lua_ls",
  "nil_ls",
  "clangd",
})
