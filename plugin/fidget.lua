-- Fidget
pcall(function()
  local fidget = require("fidget")

  -- Setup
  fidget.setup({
    text = {
      spinner = "dots",
      done = "✓",
    },
    window = {
      relative = "editor",
      blend = 50,
    },
  })
end)
