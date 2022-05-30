local cmp = require("cmp_nvim_lsp")
local utils = require("nv.utils")

local map = vim.keymap.set
local join_path = utils.join_path

-- On attach
local on_attach = function(opts)
  opts = vim.tbl_deep_extend("force", { formatting = false }, opts or {})

  return function(client, bufnr)
    -- Formattting
    client.resolved_capabilities.document_formatting = opts.formatting
    client.resolved_capabilities.document_range_formatting = opts.formatting

    -- Completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Keympas
    map("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true })
    map("n", "gh", function()
      require("nv.lsp.handlers").hover()
    end, { silent = true, noremap = true })
    map("n", ",gh", vim.diagnostic.open_float, { silent = true, noremap = true })
    map("n", "gi", vim.lsp.buf.implementation, { silent = true, noremap = true })
    map("n", "gs", function()
      require("nv.lsp.handlers").signature_help()
    end, { silent = true, noremap = true })
    map("n", "gy", vim.lsp.buf.type_definition, { silent = true, noremap = true })
    map("n", "gr", vim.lsp.buf.rename, { silent = true, noremap = true })
    map("n", "<M-CR>", vim.lsp.buf.code_action, { silent = true, noremap = true })

    -- Diagnostics
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      float = {
        border = "rounded",
      },
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
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp.update_capabilities(capabilities)

-- Lua runtime
local lua_runtime = vim.split(package.path, ";")

table.insert(lua_runtime, "lua/?.lua")
table.insert(lua_runtime, "lua/?/init.lua")

-- Servers
return {
  bashls = {
    capabilities = capabilities,
    on_attach = on_attach(),
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.zsh-theme|.command)",
    },
    filetypes = { "sh", "zsh" },
  },
  clangd = {
    capabilities = capabilities,
    on_attach = on_attach({ formatting = true }),
    filetypes = { "c", "cpp", "objc", "objcpp" },
  },
  cssls = {
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "css", "scss", "less" },
    settings = {
      css = {
        validate = true,
      },
      less = {
        validate = true,
      },
      scss = {
        validate = true,
      },
    },
  },
  gopls = {
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "go", "gomod" },
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
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "html" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
    settings = {},
  },
  intelephense = {
    capabilities = capabilities,
    on_attach = on_attach({ formatting = true }),
    filetypes = { "php" },
    init_options = {
      globalStoragePath = join_path(vim.g.nv.dir.home, ".cache", "intelephense"),
    },
  },
  jsonls = {
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "json", "jsonc" },
    init_options = {
      provideFormatter = false,
    },
  },
  prismals = {
    capabilities = capabilities,
    on_attach = on_attach({ formatting = true }),
    filetypes = { "prisma" },
  },
  pyright = {
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  rust_analyzer = {
    capabilities = capabilities,
    on_attach = on_attach({ formatting = true }),
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {},
    },
  },
  sumneko_lua = {
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = { "lua" },
    log_level = 2,
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
    capabilities = capabilities,
    on_attach = on_attach(),
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    init_options = {
      hostInfo = "neovim",
    },
  },
  vimls = {
    capabilities = capabilities,
    on_attach = on_attach({ formatting = true }),
    filetypes = { "vim" },
    init_options = {
      diagnostic = {
        enable = true,
      },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        runtimepath = true,
      },
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true,
      },
      vimruntime = "",
    },
  },
}
