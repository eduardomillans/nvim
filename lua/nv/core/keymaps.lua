local map = require("nv.utils").map

-- *******************************
-- List of keymaps
-- *******************************
local keymaps = {
  -- Resize windows
  map("n", "<M-k>", "resize -2", { "cmd", "silent" }),
  map("n", "<M-j>", "resize +2", { "cmd", "silent" }),
  map("n", "<M-h>", "vertical resize -2", { "cmd", "silent" }),
  map("n", "<M-l>", "vertical resize +2", { "cmd", "silent" }),

  -- Switch buffer
  map("n", "gn", "bnext", { "cmd", "silent" }),
  map("n", "gp", "bprevious", { "cmd", "silent" }),

  -- Better indenting
  map("n", "<", "<<", { "noremap" }),
  map("n", ">", ">>", { "noremap" }),
  map("v", "<", "<gv", { "noremap" }),
  map("v", ">", ">gv", { "noremap" }),

  -- Buffer action
  map("n", "yae", "ggyG", { "noremap" }),
  map("n", "cae", "ggcG", { "noremap" }),
  map("n", "dae", "ggdG", { "noremap" }),
  map("n", "vae", "ggVG", { "noremap" }),

  -- Toggle hlsearch
  map("n", ",nh", "set hlsearch!", { "cmd", "silent" }),

  -- Normal mode in terminal
  map("t", "<C-c>", "<C-\\><C-n>", { "noremap" }),

  -- Maximizer
  map("n", "<C-w>z", "Maximizer", { "cmd", "silent" }),
}

-- *******************************
-- Init
-- *******************************
for _, keymap in ipairs(keymaps) do
  keymap:save()
end
