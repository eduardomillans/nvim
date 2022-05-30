local is_installed, telescope = pcall(require, "telescope")
local _, actions = pcall(require, "telescope.actions")

local map = require("nv.utils").map

local fb_actions = telescope.extensions.file_browser.actions

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
      find_files = {
        hidden = true,
      },
      live_grep = {
        theme = "ivy",
      },
      diagnostics = {
        theme = "ivy",
      },
      lsp_references = {
        theme = "ivy",
      },
    },
    extensions = {
      file_browser = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        disable_devicons = true,
        hijack_netrw = true,
        mappings = {
          -- Disable all insert mode mapping
          ["i"] = {
            ["<M-c>"] = false,
            ["<M-r>"] = false,
            ["<M-m>"] = false,
            ["<M-y>"] = false,
            ["<M-d>"] = false,
            ["<C-o>"] = false,
            ["<C-g>"] = false,
            ["<C-e>"] = false,
            ["<C-w>"] = false,
            ["<C-t>"] = false,
            ["<C-f>"] = false,
            ["<C-h>"] = false,
            ["<C-s>"] = false,
          },
          ["n"] = {
            ["d"] = fb_actions.move,
            ["x"] = fb_actions.remove,
            ["-"] = fb_actions.goto_parent_dir,
            ["~"] = fb_actions.goto_home_dir,
            ["/"] = fb_actions.goto_cwd,
            ["u"] = fb_actions.change_cwd,
            ["t"] = fb_actions.toggle_browser,
            ["."] = fb_actions.toggle_all,
            -- Disable
            ["g"] = false,
            ["e"] = false,
            ["w"] = false,
            ["s"] = false,
          },
        },
      },
    },
  })
end

-- *******************************
-- Load telescope extensions
-- *******************************
local load_extensions = function()
  local exts = { "fzf", "file_browser" }

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
    map({ "i", "n" }, "<C-g>", "Telescope git_status", { "cmd", "silent" }),
    map({ "i", "n" }, ",<C-g>", 'lua require("nv.telescope.pickers").gitignore()', { "cmd", "silent" }),
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

  vim.api.nvim_create_user_command("Ex", "Telescope file_browser", {})
end
