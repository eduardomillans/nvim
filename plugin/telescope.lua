-- Telescope
pcall(function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  local map = vim.keymap.set
  local fb_actions = telescope.extensions.file_browser.actions

  -- Setup
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
        path = "%:p:h",
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

  -- Extensions
  local exts = { "fzf", "file_browser" }

  for _, ext in ipairs(exts) do
    telescope.load_extension(ext)
  end

  -- Command
  vim.api.nvim_create_user_command("Ex", "Telescope file_browser", {})

  -- Keymaps
  map("n", "<C-b>", "<CMD>Telescope buffers<CR>", { noremap = true })
  map("n", "<C-f>", "<CMD>Telescope find_files<CR>", { noremap = true })
  map("n", "<C-s>", "<CMD>Telescope live_grep<CR>", { noremap = true })
  map("n", "<C-g>s", "<CMD>Telescope git_status<CR>", { noremap = true })
  map("n", "<C-g>i", function()
    require("nv.telescope.pickers").gitignore()
  end, { noremap = true })
  map("n", "gx", "<CMD>Telescope lsp_references<CR>", { noremap = true })
  map("n", ",gd", "<CMD>Telescope diagnostics<CR>", { noremap = true })
end)
