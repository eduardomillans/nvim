local is_installed, lsp_installer = pcall(require, "nvim-lsp-installer")
local _, lsp = pcall(require, "lspconfig")
local servers = require("nv.lsp.servers")
local utils = require("nv.utils")

-- *******************************
-- Lsp [installer] setup
-- *******************************
local setup = function()
  -- Customize lsp installers
  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "❯",
        server_uninstalled = "✗",
      },
    },
    install_root_dir = utils.join_path(vim.g.nv.dir.nvim.data, "lsp-servers"),
  })

  lsp_installer.setup({})

  -- Initialize each server
  for server, opts in pairs(servers) do
    lsp[server].setup(opts)
  end

  -- Initialize rust tool
  --[[ local ok, rust_tools = pcall(require, "rust-tools")

  if ok then
    rust_tools.setup({ server = servers.rust_analyzer })
  end ]]
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
