local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

local join_path = require("nv.utils").join_path
local get_gitignore_list = require("nv.telescope.utils").get_gitignore_list

local M = {}

-- *******************************
-- Gitignore (Quick implementation)
-- *******************************

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
      results = get_gitignore_list(),
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
