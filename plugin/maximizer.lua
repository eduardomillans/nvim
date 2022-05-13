local is_installed, maximizer = pcall(require, "maximizer")

-- *******************************
-- Maximizer setup
-- *******************************
local setup = function()
  maximizer.setup({})
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
