local is_installed, telescope = pcall(require, "telescope")
local _, actions = pcall(require, "telescope.actions")

local map = require("nv.utils").map
local delete_buffer = require("nv.telescope.utils").delete_buffer

-- *******************************
-- Telescope setup
-- *******************************
local setup = function()
  telescope.setup({
    defaults = {
      prompt_prefix = " ❯ ",
      selection_caret = " ❯ ",
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
      disable_devicons = true,
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.5,
        },
      },
      mappings = {
        i = {
          ["<C-\\><Esc>"] = { "<esc>", type = "command" },
          ["<Esc>"] = actions.close,
          ["<Tab>"] = actions.toggle_selection,
          ["<S-Tab>"] = false,
        },
        n = {
          ["<Tab>"] = actions.toggle_selection,
          ["<S-Tab>"] = false,
        },
      },
    },
    pickers = {
      buffers = {
        theme = "dropdown",
        previewer = false,
        mappings = {
          i = {
            ["<M-c>"] = delete_buffer,
          },
          n = {
            ["<M-c>"] = delete_buffer,
          },
        },
      },
      find_files = {
        hidden = true,
      },
      diagnostics = {
        theme = "dropdown",
      },
    },
  })
end

-- *******************************
-- Load telescope extensions
-- *******************************
local load_extensions = function()
  local exts = { "fzf" }

  for _, ext in ipairs(exts) do
    telescope.load_extension(ext)
  end
end

-- *******************************
-- Set telescope keymaps
-- *******************************
local set_keymaps = function()
  local keymaps = {
    map({ "i", "n" }, "<C-b>", "Telescope buffers", { "cmd", "silent" }),
    map({ "i", "n" }, "<C-f>", "Telescope find_files", { "cmd", "silent" }),
    map({ "i", "n" }, "<C-s>", "Telescope live_grep", { "cmd", "silent" }),
    map({ "i", "n" }, "<C-g>", 'lua require("nv.telescope.pickers").gitignore()', { "cmd", "silent" }),
    -- For lsp
    map("n", "gx", "Telescope lsp_references", { "cmd", "silent" }),
    map("n", ",gd", "Telescope diagnostics", { "cmd", "silent" }),
  }

  for _, keymap in ipairs(keymaps) do
    keymap:save()
  end
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
  load_extensions()
  set_keymaps()
end
