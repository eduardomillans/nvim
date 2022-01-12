local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")
local Job = require("plenary.job")

local join_path = require("nv.utils").join_path

local M = {}

-- *******************************
-- Gitignore (Quick implementation)
-- *******************************
local get_gi_list = function()
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

local get_gi_file = function(items)
  vim.fn.system({
    "curl",
    "-sLo",
    join_path(vim.loop.cwd(), ".gitignore"),
    ("https://www.toptal.com/developers/gitignore/api/%s"):format(items),
  })

  vim.notify("Gitignore downloaded", vim.log.levels.INFO, { title = "Neovim" })
end

M.gitignore = function()
  local opts = themes.get_dropdown()

  pickers.new(opts, {
    prompt_title = "~ gitignore.io ~",
    finder = finders.new_table({
      results = get_gi_list(),
    }),
    sorter = config.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local items = {}
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selection = picker:get_multi_selection()

        if #selection > 0 then
          for _, selected in ipairs(selection) do
            table.insert(items, selected[1])
          end
        else
          items = { action_state.get_selected_entry()[1] }
        end

        get_gi_file(table.concat(items, ","))

        actions.close(prompt_bufnr)
      end)

      return true
    end,
  }):find()
end

return M
