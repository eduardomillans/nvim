-- Packer
pcall(function()
  local packer = require("packer")
  local utils = require("nv.utils")

  local nv = vim.g.nv

  -- Setup
  packer.init({
    compile_path = utils.join_path(nv.dir.nvim.config, "packer", "compiled.lua"),
    git = {
      subcommands = {
        fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
      },
    },
  })

  -- Command
  vim.api.nvim_create_user_command("Sync", function()
    vim.cmd(("source %s/lua/nv/plugins.lua | PackerSync"):format(nv.dir.nvim.config))
  end, {})

  -- Plugins
  packer.startup(function(use)
    -- Important
    use({ "wbthomason/packer.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" })

    -- Personal
    use({ "eduardomillans/maximizer.nvim" })

    -- Lsp
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
    })

    -- Syntax highlight
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground" })

    -- Fuzzy finder
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Progress
    use({ "j-hui/fidget.nvim" })

    -- Colorize
    use({ "norcalli/nvim-colorizer.lua" })

    -- Comments
    use({ "numToStr/Comment.nvim" })

    -- Surround
    use({ "kylechui/nvim-surround" })

    -- Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
  end)
end)
