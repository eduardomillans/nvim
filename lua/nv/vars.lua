local sysname = vim.loop.os_uname().sysname
local stdpath = vim.fn.stdpath
local is_win = sysname == "Windows_NT"

-- *******************************
-- Load local variables
-- *******************************
vim.g.nv = {
  is_linux = sysname == "Linux",
  is_mac = sysname == "Darwin",
  is_win = is_win,
  len = {
    text = 120,
    indentation = {
      default = 4,
      alt = 2,
    },
  },
  dir = {
    home = os.getenv(is_win and "USERPROFILE" or "HOME"),
    nvim = {
      config = stdpath("config"),
      cache = stdpath("cache"),
      data = stdpath("data"),
    },
  },
}
