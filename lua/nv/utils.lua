local M = {}

local cmd = vim.cmd

local sep = vim.loop.os_uname().sysname == "Windows_NT" and "\\" or "/"

-- Set highlight
M.hi = function(group, args)
  if type(args) == "string" then
    cmd(("hi! link %s %s"):format(group, args))
    return
  end

  local highlight = { "hi!", group }

  for k, v in pairs(args) do
    k = k:gsub("gui", "")
    table.insert(highlight, ("gui%s=%s"):format(k, v))
  end

  cmd(table.concat(highlight, " "))
end

-- Join path
M.join_path = function(...)
  return table.concat({ ... }, sep)
end

return M
