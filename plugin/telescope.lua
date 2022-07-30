-- Telescope
pcall(function()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local actions = require("telescope.actions")

  local map = vim.keymap.set

  -- Defaults
  local defaults = themes.get_ivy({
    prompt_prefix = " > ",
    selection_caret = " > ",
    entry_prefix = "   ",
    file_ignore_patterns = { ".git/" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    disable_devicons = false,
    -- sorting_strategy = "ascending",
    -- layout_config = {
    --   horizontal = {
    --     prompt_position = "top",
    --     preview_width = 0.5,
    --   },
    -- },

    -- layout_config = {
    --   height = 27,
    -- },
    mappings = {
      i = {
        ["<C-\\><Esc>"] = { "<esc>", type = "command" },
        ["<Esc>"] = actions.close,
        ["<C-s>"] = actions.toggle_selection,
      },
      n = {
        ["<C-s>"] = actions.toggle_selection,
      },
    },
  })

  -- Setup
  telescope.setup({
    defaults = defaults,
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  })

  -- Extensions
  local exts = { "fzf" }

  for _, ext in ipairs(exts) do
    telescope.load_extension(ext)
  end

  -- Keymaps
  map("n", "<C-b>", "<CMD>Telescope buffers<CR>", { noremap = true })
  map("n", "<C-f>", "<CMD>Telescope find_files<CR>", { noremap = true })
  map("n", "<C-s>", "<CMD>Telescope live_grep<CR>", { noremap = true })
  map("n", "<C-g>s", "<CMD>Telescope git_status<CR>", { noremap = true })
  map("n", "<C-g>b", "<CMD>Telescope git_branches<CR>", { noremap = true })
  map("n", "<C-g>i", function()
    require("nv.telescope.pickers").gitignore()
  end, { noremap = true })
  map("n", "gx", "<CMD>Telescope lsp_references<CR>", { noremap = true })
end)
