-- Set statusline
local _cwd = vim.loop.cwd()
local _version = vim.version()
local _status = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" }

local _modes = {
  ["n"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["i"] = "INSERT",
  ["t"] = "INSERT",
  ["R"] = "REPLACE",
  ["c"] = "COMMAND",
}

-- Components
local mode = function()
  local current = _modes[vim.api.nvim_get_mode().mode]

  if not current then
    current = "unknown"
  end

  return current:upper()
end

local filename = function()
  local name = vim.fn.expand("%:t")

  if #name == 0 then
    name = _status.unnamed
  end

  -- TODO: use %m?
  return ("%s%s"):format(
    name,
    (vim.bo.readonly or not vim.bo.modifiable) and _status.readonly or (vim.bo.modified and _status.modified or "")
  )
end

local git = function()
  local file = ("%s/.git/HEAD"):format(_cwd)

  if vim.fn.filereadable(file) == 0 then
    return ""
  end

  local head = vim.fn.readfile(file)[1]
  local branch = vim.fn.substitute(head, [[\C^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=]], "", "")

  return vim.trim(("%s %s"):format(#branch > 0 and "" or "", branch))
end

local lsp_client = function()
  local ft = vim.bo.filetype

  if #ft > 0 then
    for _, client in pairs(vim.lsp.buf_get_clients()) do
      if client.name ~= "null-ls" and vim.tbl_contains(client.config.filetypes, ft) then
        return client.name
      end
    end
  end

  return ""
end

local version = function()
  return ("v%s.%s.%s"):format(_version.major, _version.minor, _version.patch)
end

local filetype = function()
  local ft = vim.bo.filetype

  return #ft > 0 and ft or "no ft"
end

local fileencoding = function()
  return #vim.bo.fileencoding ~= 0 and vim.bo.fileencoding or vim.o.encoding
end

local fileformat = function()
  return vim.bo.fileformat
end

local location = function()
  return " %l:%c"
end

-- Build
local hi = function(highlight, component)
  local output = { highlight }

  if #component > 0 then
    table.insert(output, (" %s "):format(vim.trim(component)))
  end

  return table.concat(output)
end

StatusLine = function()
  local components = {
    hi("%#StatusLineA#", mode()),
    ---
    hi("%#StatuslineB#", git()),
    ---
    hi("%#StatusLineC#", filename()),
    ---
    "%=",
    ---
    hi("%#StatusLineC#", version()),
    ---
    hi("%#StatuslineB#", table.concat({ filetype(), fileencoding(), fileformat() }, " | ")),
    ---
    hi("%#StatuslineA#", location()),
  }

  return table.concat(components)
end

-- Autocmd
vim.cmd([[
  augroup StatusLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal statusline=%!v:lua.StatusLine()
  augroup END
]])
