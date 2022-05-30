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
      "markdown",
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
  })
end)
