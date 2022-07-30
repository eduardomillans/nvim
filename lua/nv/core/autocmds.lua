local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Set autocmds
local group = augroup("NVAutocmds", { clear = true })

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 250 })
  end,
  group = group,
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.formatting_sync({}, 1000)
  end,
  group = group,
})

autocmd("TermOpen", { pattern = "*", command = "setlocal norelativenumber", group = group })

autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.h", command = "setlocal filetype=c", group = group })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.zsh-theme", command = "setlocal filetype=zsh", group = group })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "tsconfig.json", command = "setlocal filetype=jsonc", group = group })
