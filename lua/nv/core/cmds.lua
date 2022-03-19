local utils = require("nv.utils")

local command = utils.command

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local cmd = vim.cmd

-- *******************************
-- Commands
-- *******************************
command("Terminal", "new | set norelativenumber | terminal")
command("VTerminal", "vnew | set norelativenumber | terminal")
command("TTerminal", "tabnew | set norelativenumber | terminal")

command("Format", 'lua require("nv.utils").format()')
command("Sync", 'lua require("nv.utils").sync()')

-- *******************************
-- Autocmds
-- *******************************
local group = augroup("MyAutocmds", { clear = true })

autocmd(
  "TextYankPost",
  { pattern = "*", command = 'silent! lua vim.highlight.on_yank{higroup="Visual", timeout=250}', group = group }
)

autocmd("FileType", { pattern = "qf", command = "nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>", group = group })

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.tbl_filter(function(client)
      return client.supports_method("textDocument/formatting")
    end, vim.lsp.buf_get_clients())

    if #clients > 0 then
      cmd("silent lua vim.lsp.buf.formatting_sync({}, 1000)")
      return
    end

    local pos = vim.fn.getpos(".")
    cmd("normal gg=G")
    vim.fn.setpos(".", pos)
    cmd("normal zz")
    cmd("silent! write")
  end,
  group = group,
})

autocmd("BufRead,BufNewFile", { pattern = "tsconfig.json", command = "setlocal filetype=jsonc", group = group })
