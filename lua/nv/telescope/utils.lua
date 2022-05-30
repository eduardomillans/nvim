local Job = require("plenary.job")
local join_path = require("nv.utils").join_path

local M = {}

-- Fetch gitginore list
M.fetch_gitginore_list = function()
  local results = {}

  local list = Job
    :new({
      command = "curl",
      args = { "-sL", "https://www.toptal.com/developers/gitignore/api/list" },
    })
    :sync()

  if list then
    for _, item in ipairs(list) do
      local row = vim.split(item, ",")
      for _, v in ipairs(row) do
        table.insert(results, v)
      end
    end
  end

  return results
end

-- Fetch gitignore file
M.fetch_gitignore_file = function(items)
  vim.fn.system({
    "curl",
    "-sLo",
    join_path(vim.loop.cwd(), ".gitignore"),
    ("https://www.toptal.com/developers/gitignore/api/%s"):format(items),
  })

  vim.notify("Gitignore downloaded", vim.log.levels.INFO, { title = "Neovim" })
end

return M
