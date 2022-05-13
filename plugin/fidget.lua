local is_installed, fidget = pcall(require, "fidget")

-- *******************************
-- Fidget setup
-- *******************************
local setup = function()
  fidget.setup({
    text = {
      spinner = "meter",
      done = "✓",
    },
    window = {
      relative = "editor",
      blend = 50,
    },
  })
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
