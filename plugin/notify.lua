local is_installed, notify = pcall(require, "notify")

-- *******************************
-- Notify setup
-- *******************************
local setup = function()
  notify.setup({
    timeout = 3500,
    icons = {
      ERROR = "㎵",
      WARN = "㎵",
      INFO = "㎵",
      DEBUG = "㎵",
      TRACE = "㎵",
    },
  })

  vim.notify = notify
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
