local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

local utils = require("nv.telescope.utils")

local M = {}

-- Gitignore picker
-- TODO: Separate in a plugin?
M.gitignore = function()
  local opts = themes.get_ivy()

  pickers.new(opts, {
    prompt_title = "~ gitignore.io ~",
    finder = finders.new_table({
      results = utils.fetch_gitginore_list(),
      entry_maker = function(entry)
        return { value = entry, display = entry.name, ordinal = entry.key }
      end,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(opts),
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry)
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, vim.split(entry.value.contents, "\n"))
      end,
    }),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local files = {}
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selection = picker:get_multi_selection()

        for _, entry in ipairs(#selection > 0 and selection or { action_state.get_selected_entry() }) do
          table.insert(files, entry.value.key)
        end

        utils.fetch_gitignore(files)

        actions.close(prompt_bufnr)
      end)

      return true
    end,
  }):find()
end

return M
