local utils = require("nv.utils")

local join_path = utils.join_path
local opt = utils.opt

local nv = vim.g.nv

-- *******************************
-- List of options
-- *******************************
local options = {
  opt("hidden", true),
  opt("confirm", true),
  opt("termguicolors", true),
  opt("clipboard", "unnamedplus"),
  opt("mouse", "a"),
  opt("guicursor", ""),
  opt("t_Co", 256),
  opt("backup", false),
  opt("writebackup", false),
  opt("swapfile", false),
  opt("directory", join_path(nv.dir.home, ".cache", "nvim", "swap")),
  opt("undodir", join_path(nv.dir.home, ".cache", "nvim", "undo")),
  opt("backupdir", join_path(nv.dir.home, ".cache", "nvim", "backup")),
  opt("viewdir", join_path(nv.dir.home, ".cache", "nvim", "view")),
  opt("history", 2000),
  opt("updatetime", 250),
  opt("complete", ".,w,b,k"),
  opt("fillchars", "vert:\\ "),
  opt("whichwrap", "<,>,[,],h,l", "append"),
  opt("splitbelow", true),
  opt("splitright", true),
  opt("backspace", "indent,eol,start"),
  opt("completeopt", "menu,menuone,noselect"),
  -- opt("showmode", false),
  -- opt("showcmd", false),
  opt("shortmess", "c", "append"),
  -- opt("showtabline", 2),
  opt("pumheight", 12),
  opt("helpheight", 12),
  opt("previewheight", 12),
  opt("cmdheight", 2),
  opt("cmdwinheight", 2),
  opt("textwidth", nv.len.text),
  opt("smartindent", true),
  opt("expandtab", true),
  opt("tabstop", nv.len.indentation.default),
  opt("shiftwidth", nv.len.indentation.default),
  opt("wrap ", false),
  opt("relativenumber", true),
  opt("signcolumn", "yes"),
  opt("conceallevel", 0),
}

-- *******************************
-- Init
-- *******************************
for _, option in ipairs(options) do
  option:save()
end
