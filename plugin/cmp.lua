local is_installed, cmp = pcall(require, "cmp")
local _, types = pcall(require, "cmp.types")

local stats = vim.api.nvim_list_uis()[1]
local screen_width = stats.width
local screen_height = stats.height

local menu = {
  nvim_lsp = "[Lsp]",
  nvim_lua = "[Lua]",
  path = "[Path]",
}

-- *******************************
-- Cmp setup
-- *******************************
local setup = function()
  cmp.setup({
    completion = {
      autocomplete = false,
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    documentation = {
      border = "rounded",
      -- I'm not sure
      maxwidth = math.ceil(screen_width * 0.35),
      maxheight = math.ceil(screen_height * 0.35),
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
    }),
  })
end

-- *******************************
-- Init
-- *******************************
if is_installed then
  setup()
end
