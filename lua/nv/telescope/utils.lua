local Job = require("plenary.job")
local join_path = require("nv.utils").join_path

local M = {}

-- Fetch gitginore list
M.fetch_gitginore_list = function()
  local results = {}

  local response = Job
    :new({
      command = "curl",
      args = { "-sL", "https://www.toptal.com/developers/gitignore/api/list?format=json" },
    })
    :sync()

  if response then
    local list = vim.fn.json_decode(response[1])

    for _, item in pairs(list) do
      table.insert(results, { key = item.key, name = item.name, contents = item.contents:sub(2, #item.contents - 2) })
    end
  end

  return results
end

-- Fetch gitignore
M.fetch_gitignore = function(files)
  vim.fn.system({
    "curl",
    "-sLo",
    join_path(vim.loop.cwd(), ".gitignore"),
    ("https://www.toptal.com/developers/gitignore/api/%s"):format(table.concat(files, ",")),
  })

  vim.notify(
    ("gitignore dowloaded: %s"):format(table.concat(files, ", ")),
    vim.log.levels.INFO,
    { title = "Telescope gitignore" }
  )
end

return M
