local is_installed, packer = pcall(require, "packer")
local join_path = require("nv.utils").join_path

local nv = vim.g.nv

-- *******************************
-- Packer setup
-- *******************************
local setup = function()
  packer.init({
    compile_path = join_path(nv.dir.nvim.config, "packer", "compiled.lua"),
    git = {
      subcommands = {
        fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
      },
    },
  })

  packer.startup(function(use)
    -- Packer itself
    use({ "wbthomason/packer.nvim" })

    -- Required by lua plugins
    use({ "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" })

    -- Personal
    use({ "eduardomillans/maximizer.nvim" })

    -- Lsp
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/nvim-lsp-installer" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "simrat39/rust-tools.nvim" })

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

    -- Fuzzy finder
    use({ "nvim-telescope/telescope.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Quickfix
    use({ "kevinhwang91/nvim-bqf" })

    -- Git
    use({ "tpope/vim-fugitive" })

    -- Comments
    use({ "b3nj5m1n/kommentary" })

    -- Surround
    use({ "tpope/vim-surround" })

    -- Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })
  end)
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
