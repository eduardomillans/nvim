local M = {}

-- *******************************
-- Set code actions
-- *******************************
M.set = function(sources, null_ls)
  local code_actions = {}

  for code_action, opts in pairs(code_actions) do
    table.insert(sources, null_ls.builtins.code_actions[code_action].with(opts))
  end
end

return M
