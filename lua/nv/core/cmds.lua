local utils = require("nv.utils")

local autocmd = utils.autocmd
local command = utils.command

-- *******************************
-- Autocmds
-- *******************************
autocmd("TextYankPost", "*", 'silent! lua vim.highlight.on_yank{higroup="Visual", timeout=250}')
autocmd("FileType", "qf", "nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>")
autocmd("BufWritePre", "*", 'lua require("nv.utils").format()')
autocmd("BufRead,BufNewFile", "tsconfig.json", "setlocal filetype=jsonc")

-- *******************************
-- Commands
-- *******************************
command("Terminal", "vnew | set norelativenumber | terminal")
command("Format", 'lua require("nv.utils").format()')
command("Sync", "PackerSync")
