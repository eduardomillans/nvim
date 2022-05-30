local utils = require("nv.lsp.utils")
local join_path = require("nv.utils").join_path

-- *******************************
-- List of servers
-- *******************************
return {
  bashls = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.zsh-theme|.command)",
    },
    filetypes = { "sh", "zsh" },
  },
  clangd = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(true),
    filetypes = { "c", "cpp", "objc", "objcpp" },
  },
  cssls = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(true),
    filetypes = { "php" },
    init_options = {
      globalStoragePath = join_path(vim.g.nv.dir.home, ".cache", "intelephense"),
    },
  },
  jsonls = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
    filetypes = { "json", "jsonc" },
    init_options = {
      provideFormatter = false,
    },
  },
  prismals = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(true),
    filetypes = { "prisma" },
  },
  pyright = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(true),
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {},
    },
  },
  sumneko_lua = {
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
    filetypes = { "lua" },
    log_level = 2,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = utils.get_lua_runtime(),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(false),
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
    capabilities = utils.get_capabilities(),
    on_attach = utils.get_on_attach(true),
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
