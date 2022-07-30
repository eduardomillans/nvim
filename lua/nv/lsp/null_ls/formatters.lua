local len = vim.g.nv.len

local M = {}

-- Set formatters
M.set = function(sources, null_ls)
  local formatters = {
    black = {
      extra_args = { "--line-length", len.text },
    },
    prettierd = {
      disabled_filetypes = { "markdown" },
    },
    shfmt = {
      filetypes = { "sh", "zsh" },
      extra_args = { "-i", len.indentation.default },
    },
    stylua = {},
  }

  for formatter, opts in pairs(formatters) do
    table.insert(sources, null_ls.builtins.formatting[formatter].with(opts))
  end
end

return M
