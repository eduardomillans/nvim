local is_installed, bqf = pcall(require, "bqf")

-- *******************************
-- Bqf setup
-- *******************************
local setup = function()
  bqf.setup({
    -- auto_enable = false,
    preview = {
      auto_preview = false,
      border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
      win_height = 12,
      win_vheight = 12,
    },
    func_map = {
      open = "",
      openc = "<CR>",
      -- ptoggleitem = "p",
      pscrollup = "<C-u>",
      pscrolldown = "<C-d>",
      pscrollorig = "zz",
    },
  })
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
