local sysname = vim.loop.os_uname().sysname
local stdpath = vim.fn.stdpath
local expand = vim.fn.expand
local is_win = sysname == "Windows_NT"

-- Set global neovim variables
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

-- Set env variables
vim.env.PRETTIERD_DEFAULT_CONFIG = expand("~/.config/nvim/.prettierrc.json")
vim.env.WORKSPACE = expand("~/dev/java")
