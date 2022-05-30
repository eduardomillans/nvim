local is_installed, comment = pcall(require, "Comment")

-- *******************************
-- Comment setup
-- *******************************
local setup = function()
  comment.setup()
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
