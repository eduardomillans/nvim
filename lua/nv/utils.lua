local M = {}

local cmd = vim.cmd
local api = vim.api

local sep = vim.loop.os_uname().sysname == "Windows_NT" and "\\" or "/"

-- *******************************
-- Vim option
-- *******************************
local Option = {}

function Option:new(property, value, action)
  local instance = {
    property = property,
    value = value,
    action = action,
  }

  setmetatable(instance, self)
  self.__index = self

  return instance
end

function Option:save()
  local action = "="

  if self.action == "append" then
    action = "+="
  elseif self.action == "prepend" then
    action = "^="
  elseif self.action == "remove" then
    action = "-="
  end

  if self.value == true then
    cmd(("set %s"):format(self.property))
  elseif self.value == false then
    cmd(("set no%s"):format(self.property))
  else
    cmd(("set %s%s%s"):format(self.property, action, self.value))
  end
end

M.opt = function(property, value, action)
  action = action or nil
  return Option:new(property, value, action)
end

-- *******************************
-- Vim keymap
-- *******************************
local Keymap = {}

function Keymap:new(modes, key, action, opts)
  local instance = {
    modes = modes,
    key = key,
    action = action,
    opts = opts,
  }

  setmetatable(instance, self)
  self.__index = self

  return instance
end

function Keymap:save()
  for _, mode in ipairs(self.modes) do
    api.nvim_set_keymap(mode, self.key, self.action, self.opts)
  end
end

M.map = function(modes, key, action, opts)
  -- Validations
  vim.validate({
    modes = {
      modes,
      function(value)
        return type(value) == "string" or type(value) == "table"
      end,
      "string or table",
    },
    key = { key, "string" },
    action = { action, "string" },
    opts = { opts, "table", true },
  })

  modes = type(modes) == "string" and { modes } or modes
  local _opts = { noremap = false, silent = false, expr = false, nowait = false }

  if opts ~= nil and not vim.tbl_isempty(opts) then
    for _, opt in ipairs(opts) do
      if opt == "cmd" then
        action = ("<Esc>:%s<CR>"):format(action)
      elseif vim.tbl_contains(vim.tbl_keys(_opts), opt) then
        _opts[opt] = true
      end
    end
  end

  return Keymap:new(modes, key, action, _opts)
end

-- *******************************
-- Vim command
-- *******************************
M.command = function(name, action)
  vim.validate({
    name = { name, "string" },
    action = { action, "string" },
  })

  -- name = name:sub(1, 1):upper .. name:sub(2)

  cmd(("command! %s %s"):format(name, action))
end

-- *******************************
-- Join path
-- *******************************
M.join_path = function(...)
  return table.concat({ ... }, sep)
end

-- *******************************
-- Sync plugins
-- *******************************
M.sync = function()
  cmd(("source %s/lua/nv/plugins.lua | PackerSync"):format(vim.g.nv.dir.nvim.config))
end

return M
