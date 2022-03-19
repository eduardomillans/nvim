local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- *******************************
-- Statusline components
-- *******************************
local filename = function()
  return "%F %m"
end

local git = function()
  local file = ("%s/.git/HEAD"):format(vim.loop.cwd())

  if vim.fn.filereadable(file) == 0 then
    return ""
  end

  local head = vim.fn.readfile(file)[1]
  local branch = vim.fn.substitute(head, [[\C^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=]], "", "")

  return (" %s"):format(branch)
end

local lsp_client = function()
  for _, client in ipairs(vim.lsp.buf_get_clients()) do
    if client.name ~= "null-ls" then
      return client.name
    end
  end

  return ""
end

local lsp_diagnostics = function()
  local diagnostics = {}

  for _, level in ipairs({ "ERROR", "WARN", "INFO", "HINT" }) do
    local results = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] })

    if not vim.tbl_isempty(results) then
      table.insert(diagnostics, ("%s %s"):format(level:sub(1, 1):upper(), #results))
    end
  end

  return table.concat(diagnostics, "  ")
end

local filetype = function()
  return vim.bo.filetype
end

local fileencoding = function()
  return #vim.bo.fileencoding ~= 0 and vim.bo.fileencoding or vim.o.encoding
end

local fileformat = function()
  return vim.o.fileformat
end

local location = function()
  return "%l:%c"
end

-- *******************************
-- Set statusline
-- *******************************
local set_statusline = function(active)
  if not active then
    return filename()
  end

  local components = {
    filename(),
    git(),
    "%=",
    filetype(),
    fileencoding(),
    fileformat(),
    location(),
  }

  return table.concat(components, "  ")
end

-- *******************************
-- Statusline autocmds
-- *******************************
local group = augroup("Statusline", { clear = true })

autocmd("WinEnter,BufEnter", {
  pattern = "*",
  callback = function()
    set_statusline(true)
  end,
  group = group,
})

autocmd("WinLeave,BufLeave", {
  pattern = "*",
  callback = function()
    set_statusline(false)
  end,
  group = group,
})
