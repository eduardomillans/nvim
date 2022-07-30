-- Treesiter
pcall(function()
  local treesitter = require("nvim-treesitter.configs")

  -- Setup
  treesitter.setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "comment",
      "cpp",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "make",
      "prisma",
      "python",
      "query",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = false,
    },
  })

  -- Keymaps
  vim.keymap.set("n", ",,g", "<CMD>TSCaptureUnderCursor<CR>", { noremap = true, silent = true })
end)
