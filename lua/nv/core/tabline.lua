local fn = vim.fn

local label = function(n)
  local buflist = fn.tabpagebuflist(n)
  local winnr = fn.tabpagewinnr(n)
  local bufname = fn.bufname(buflist[winnr])

  if #bufname == 0 then
    return "[No Name]"
  end

  local parent = fn.fnamemodify(bufname, ":h")

  local name = {}

  if parent ~= "." then
    for _, dir in ipairs(vim.split(parent, "/", { trimempty = true })) do
      table.insert(name, dir:sub(1, 1))
    end
  end

  table.insert(name, fn.fnamemodify(bufname, ":t"))

  return table.concat(name, "/")
end

Tabline = function()
  local tabline = {}

  for i = 1, fn.tabpagenr("$") do
    table.insert(tabline, i == fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#")
    table.insert(tabline, ("%%%dT"):format(i))
    table.insert(tabline, (" %s "):format(label(i)))
    table.insert(tabline, "%#TabLineFill#%T")
  end

  return table.concat(tabline)
end

vim.cmd([[set tabline=%!v:lua.Tabline()]])
