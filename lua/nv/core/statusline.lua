local autogroup = require("nv.utils").autogroup

local M = {}

-- *******************************
-- Statusline components
-- *******************************
M.filename = function()
  return "%F %m"
end

M.git = function()
  local file = ("%s/.git/HEAD"):format(vim.loop.cwd())

  if vim.fn.filereadable(file) == 0 then
    return ""
  end

  local head = vim.fn.readfile(file)[1]
  local branch = vim.fn.substitute(head, [[\C^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=]], "", "")

  return (" %s"):format(branch)
end

M.lsp_client = function()
  for _, client in ipairs(vim.lsp.buf_get_clients()) do
    if client.name ~= "null-ls" then
      return client.name
    end
  end

  return ""
end

M.lsp_diagnostics = function()
  local diagnostics = {}

  for _, level in ipairs({ "ERROR", "WARN", "INFO", "HINT" }) do
    local results = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] })

    if not vim.tbl_isempty(results) then
      table.insert(diagnostics, ("%s %s"):format(level:sub(1, 1):upper(), #results))
    end
  end

  return table.concat(diagnostics, "  ")
end

M.filetype = function()
  return vim.bo.filetype
end

M.fileencoding = function()
  return #vim.bo.fileencoding ~= 0 and vim.bo.fileencoding or vim.o.encoding
end

M.fileformat = function()
  return vim.o.fileformat
end

M.location = function()
  return "%l:%c"
end

-- *******************************
-- Set statusline
-- *******************************
Statusline = setmetatable(M, {
  __call = function(self, active)
    if not active then
      return self.filename()
    end

    local components = {
      self.filename(),
      self.git(),
      "%=",
      self.filetype(),
      self.fileencoding(),
      self.fileformat(),
      self.location(),
    }

    return table.concat(components, "  ")
  end,
})

autogroup("Statusline", {
  { "WinEnter,BufEnter", "*", "setlocal statusline=%!v:lua.Statusline(v:true)" },
  { "WinLeave,BufLeave", "*", "setlocal statusline=%!v:lua.Statusline(v:false)" },
})
