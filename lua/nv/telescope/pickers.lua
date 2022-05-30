local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

local utils = require("nv.telescope.utils")

local M = {}

-- Gitignore picker
-- TODO: Add preview
M.gitignore = function()
  local opts = themes.get_dropdown()

  pickers.new(opts, {
    prompt_title = "~ gitignore.io ~",
    finder = finders.new_table({
      results = utils.fetch_gitginore_list(),
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

        utils.fetch_gitignore_file(table.concat(items, ","))

        actions.close(prompt_bufnr)
      end)

      return true
    end,
  }):find()
end

return M
