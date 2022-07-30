local M = {}

-- Set diagnostics
M.set = function(sources, null_ls)
  local diagnostics = {
    eslint_d = {
      condition = function(utils)
        return utils.root_has_file({
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json",
        })
      end,
    },
  }

  for diagnostic, opts in pairs(diagnostics) do
    table.insert(sources, null_ls.builtins.diagnostics[diagnostic].with(opts))
  end
end

return M
