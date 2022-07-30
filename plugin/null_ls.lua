-- Null ls
pcall(function()
  local null_ls = require("null-ls")
  local actions = require("nv.lsp.null_ls.actions")
  local diagnostics = require("nv.lsp.null_ls.diagnostics")
  local formatters = require("nv.lsp.null_ls.formatters")

  local sources = {}

  -- Set builtins
  actions.set(sources, null_ls)
  diagnostics.set(sources, null_ls)
  formatters.set(sources, null_ls)

  -- Setup
  null_ls.setup({
    sources = sources,
  })
end)
