local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local command = vim.api.nvim_create_user_command
local cmd = vim.cmd

-- *******************************
-- Commands
-- *******************************
command("Sync", function()
  cmd(("source %s/lua/nv/plugins.lua | PackerSync"):format(vim.g.nv.dir.nvim.config))
end, {})

-- *******************************
-- Autocmds
-- *******************************
local group = augroup("NVAutocmds", { clear = true })

autocmd(
  "TextYankPost",
  { pattern = "*", command = 'silent! lua vim.highlight.on_yank{higroup="Visual", timeout=250}', group = group }
)

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.formatting_sync({}, 1000)
  end,
  group = group,
})

autocmd("TermOpen", { pattern = "*", command = "setlocal norelativenumber" })

autocmd("FileType", { pattern = "qf", command = "nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>", group = group })
autocmd("FileType", { pattern = "lsp-installer", command = "set nocursorline", group = group })

autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.zsh-theme", command = "setlocal filetype=zsh", group = group })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "tsconfig.json", command = "setlocal filetype=jsonc", group = group })
