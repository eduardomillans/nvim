-- Null ls
pcall(function()
    local null_ls = require("null-ls")
    local formatters = require("nv.lsp.null_ls.formatters")

    local sources = {}

    -- Formatters
    formatters.set(sources, null_ls)

    -- Setup
    null_ls.setup({
      sources = sources,
    })
end)
