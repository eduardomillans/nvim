local M = {}

-- Set code actions
M.set = function(sources, null_ls)
  local actions = {
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

  for action, opts in pairs(actions) do
    table.insert(sources, null_ls.builtins.code_actions[action].with(opts))
  end
end

return M
