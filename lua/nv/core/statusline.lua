local cwd = vim.loop.cwd()
local modes = {
  ["n"] = "NORMAL",
  ["no"] = "O-PENDING",
  ["nov"] = "O-PENDING",
  ["noV"] = "O-PENDING",
  ["no\22"] = "O-PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "REPLACE",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

-- *******************************
-- Statusline components
-- *******************************
local mode = function()
  return modes[vim.api.nvim_get_mode().mode]:upper()
end

local filename = function()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")

  if path == "" or path == "." then
    path = "[No Name]"
  end

  return path
end

local git = function()
  local file = ("%s/.git/HEAD"):format(cwd)

  if vim.fn.filereadable(file) == 0 then
    return ""
  end

  local head = vim.fn.readfile(file)[1]
  local branch = vim.fn.substitute(head, [[\C^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=]], "", "")

  return vim.trim(("%s %s"):format(#branch > 0 and "" or "", branch))
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
  return vim.bo.fileformat
end

local location = function()
  return "%l:%c"
end

-- *******************************
-- Set statusline
-- *******************************
StatusLine = function()
  local components = {
    "%#StatusLineA#",
    " ",
    mode(),
    " ",
    "%#StatusLineAS#",
    "",
    ---
    "%#StatuslineB#",
    " ",
    -- filename(),
    git(),
    " ",
    "%#StatuslineBS#",
    "",
    ---
    "%#StatusLineC#",
    " ",
    -- git(),
    filename(),
    ---
    "%=",
    ---
    "%#StatusLineC#",
    lsp_client(),
    ---
    " ",
    "%#StatuslineBS#",
    "",
    "%#StatuslineB#",
    " ",
    filetype(),
    "  ",
    fileencoding(),
    "  ",
    fileformat(),
    ---
    " ",
    "%#StatuslineAS#",
    "",
    "",
    "%#StatuslineA#",
    " ",
    location(),
    " ",
  }

  return table.concat(components)
end

-- *******************************
-- Statusline autocmd
-- *******************************
vim.cmd([[
  augroup StatusLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal statusline=%!v:lua.StatusLine()
  au User FugitiveChanged doautocmd BufEnter
  augroup END
]])
