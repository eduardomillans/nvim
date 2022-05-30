-- Cmp
pcall(function()
  local cmp = require("cmp")
  local types = require("cmp.types")

  -- Width and height
  local stats = vim.api.nvim_list_uis()[1]
  local maxwidth = math.ceil(stats.width > 175 and stats.width * 0.5 or stats.width * 0.35)
  local maxheight = math.ceil(stats.height > 35 and stats.height * 0.25 or stats.height * 0.5)

  -- Menu kind
  local menu = {
    nvim_lsp = "[Lsp]",
    nvim_lua = "[Lua]",
    path = "[Path]",
  }

  -- Setup
  cmp.setup({
    completion = {
      autocomplete = false,
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = {
        border = "rounded",
      },
      documentation = {
        border = "rounded",
        maxwidth = maxwidth,
        maxheight = maxheight,
      },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = menu[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.config.disable,
      ["<Tab>"] = cmp.config.disable,
      ["<S-Tab>"] = cmp.config.disable,
      --
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<M-CR>"] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "vsnip" },
    }),
  })
end)
