local is_installed, treesitter = pcall(require, "nvim-treesitter.configs")

-- *******************************
-- Treesitter setup
-- *******************************
local setup = function()
  treesitter.setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
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
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
