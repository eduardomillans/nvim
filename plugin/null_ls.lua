local is_installed, null_ls = pcall(require, "null-ls")
local formatters = require("nv.lsp.null_ls.formatters")
local utils = require("nv.lsp.utils")

-- *******************************
-- Null ls setup
-- *******************************
local setup = function()
  local sources = {}

  -- Set formatters
  formatters.set(sources, null_ls)

  -- Setup
  null_ls.setup({
    on_attach = utils.get_on_attach(true),
    sources = sources,
  })
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
