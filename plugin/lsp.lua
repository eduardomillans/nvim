local is_installed, lsp_installer = pcall(require, "nvim-lsp-installer")
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

  -- Initialize each server
  lsp_installer.on_server_ready(function(server)
    local opts = servers[server.name]

    if server.name == "rust_analyzer" then
      require("rust-tools").setup({
        server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      })

      server:attach_buffers()
    else
      server:setup(opts)
    end
  end)
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
