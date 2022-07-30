-- Lsp
pcall(function()
  local mason = require("mason")
  local masonlsp = require("mason-lspconfig")
  local lsp = require("lspconfig")
  local utils = require("nv.utils")

  local map = vim.keymap.set

  -- Make on attach
  local make_on_attach = function(formatting)
    return function(client, bufnr)
      -- Formattting
      client.resolved_capabilities.document_formatting = formatting
      client.resolved_capabilities.document_range_formatting = formatting

      -- Completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Keympas
      map("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true })
      map("n", "gh", function()
        require("nv.lsp.handlers").hover()
      end, { silent = true, noremap = true })
      map("n", "gH", vim.diagnostic.open_float, { silent = true, noremap = true })
      map("n", "gi", vim.lsp.buf.implementation, { silent = true, noremap = true })
      map("n", "gs", function()
        require("nv.lsp.handlers").signature_help()
      end, { silent = true, noremap = true })
      map("n", "gy", vim.lsp.buf.type_definition, { silent = true, noremap = true })
      map("n", "gr", vim.lsp.buf.rename, { silent = true, noremap = true })
      map("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true, noremap = true })
      map("n", "᎑", vim.lsp.buf.code_action, { silent = true, noremap = true })

      -- Diagnostics
      vim.diagnostic.config({
        virtual_text = false,
        underline = false,
        severity_sort = true,
        update_in_insert = true,
      })

      for _, type in ipairs({ "Error", "Warn", "Hint", "Info" }) do
        local hl = ("DiagnosticSign%s"):format(type)
        vim.fn.sign_define(hl, { text = ">>", texthl = hl, numhl = hl })
      end
    end
  end

  -- Capabilities
  local make_capabilities = function(snippet_support)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = snippet_support

    pcall(function()
      capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
    end)

    return capabilities
  end

  -- Lua runtime
  local lua_runtime = vim.split(package.path, ";")

  table.insert(lua_runtime, "lua/?.lua")
  table.insert(lua_runtime, "lua/?/init.lua")

  -- Servers
  local servers = {
    bashls = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(false),
      cmd_env = {
        GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.zsh-theme|.command)",
      },
      filetypes = { "sh", "zsh" },
    },
    clangd = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
    },
    cssls = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(true),
    },
    gopls = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    },
    html = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(true),
    },
    intelephense = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
      init_options = {
        globalStoragePath = utils.join_path(vim.g.nv.dir.home, ".cache", "intelephense"),
      },
    },
    jsonls = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(true),
      filetypes = { "json", "jsonc" },
    },
    prismals = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
    },
    pyright = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(false),
    },
    rust_analyzer = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
    },
    sumneko_lua = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(false),
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = lua_runtime,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
    tsserver = {
      on_attach = make_on_attach(false),
      capabilities = make_capabilities(false),
    },
    vimls = {
      on_attach = make_on_attach(true),
      capabilities = make_capabilities(false),
    },
  }

  -- Mason setup
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = ">",
        package_uninstalled = "✕",
      },
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "mason.nvim",
    command = "set nocursorline",
    group = vim.api.nvim_create_augroup("Mason", { clear = true }),
  })

  -- Mason lsp setup
  masonlsp.setup()

  -- Lsp setup
  for server, opts in pairs(servers) do
    lsp[server].setup(opts)
  end
end)
