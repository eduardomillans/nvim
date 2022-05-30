-- Lsp
local installer = require("nvim-lsp-installer")
local lsp = require("lspconfig")
local servers = require("nv.lsp.servers")
local utils = require("nv.utils")

-- Installer setup
installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "❯",
      server_uninstalled = "✗",
    },
  },
  install_root_dir = utils.join_path(vim.g.nv.dir.nvim.data, "lsp-servers"),
})

installer.setup({})

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "lsp-installer",
    command = "set nocursorline",
    group = vim.api.nvim_create_augroup("LspInstaller", { clear = true }),
  }
)

-- Lsp setup
for server, opts in pairs(servers) do
  lsp[server].setup(opts)
end
