local state = require("telescope.actions.state")
local Job = require("plenary.job")

local M = {}

-- *******************************
-- Get gitignore list
-- *******************************
M.get_gitignore_list = function()
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

-- *******************************
-- Delete buffer
-- *******************************
M.delete_buffer = function()
  local entry = state.get_selected_entry()
  vim.api.nvim_buf_delete(entry.bufnr, {})
  vim.cmd("Telescope buffers")
end

return M
