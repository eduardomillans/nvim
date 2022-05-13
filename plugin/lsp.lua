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
    if server ~= "rust_tools" then
      lsp[server].setup(opts)
    else
      require("rust-tools").setup({ server = opts })
    end
  end

  --[[ lsp_installer.on_server_ready(function(server)
    local opts = servers[server.name]

    if server.name == "rust_analyzer" then
      require("rust-tools").setup({
        server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      })

      server:attach_buffers()
    else
      server:setup(opts)
    end
  end) ]]
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
