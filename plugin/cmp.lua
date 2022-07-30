-- Cmp
pcall(function()
  local cmp = require("cmp")
  local types = require("cmp.types")

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
        winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat,CursorLine:PmenuSel,Search:None",
      },
    },
    formatting = {
      fields = { "abbr", "kind" },
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
      ["᎑"] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "vsnip" },
    }),
  })
end)
