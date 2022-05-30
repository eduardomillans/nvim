local opt = vim.opt
local nv = vim.g.nv

local join_path = require("nv.utils").join_path

-- Set options
opt.hidden = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.mouse = { a = true }
opt.guicursor = ""
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.directory = join_path(nv.dir.home, ".cache", "nvim", "swap")
opt.undodir = join_path(nv.dir.home, ".cache", "nvim", "undo")
opt.backupdir = join_path(nv.dir.home, ".cache", "nvim", "backup")
opt.viewdir = join_path(nv.dir.home, ".cache", "nvim", "view")
opt.laststatus = 3
opt.history = 2000
opt.updatetime = 250
opt.fillchars = { vert = " " }
opt.whichwrap:append({ ["<"] = true, [">"] = true, ["["] = true, ["]"] = true, ["h"] = true, ["l"] = true })
opt.splitbelow = true
opt.splitright = true
opt.backspace = { "indent", "eol", "start" }
opt.completeopt = { "menu", "menuone", "noselect" }
opt.showmode = false
opt.showcmd = false
opt.shortmess:append({ c = true })
opt.showtabline = 1
opt.pumheight = 12
opt.helpheight = 12
opt.previewheight = 12
opt.cmdheight = 2
opt.cmdwinheight = 2

opt.textwidth = nv.len.text
opt.smartindent = true
opt.expandtab = true
opt.tabstop = nv.len.indentation.default
opt.shiftwidth = nv.len.indentation.default

opt.wrap = false
opt.relativenumber = true
opt.signcolumn = "yes"
opt.conceallevel = 0
