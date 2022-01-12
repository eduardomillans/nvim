-- *******************************
-- List of providers
-- *******************************
local providers = {
  python3 = vim.fn.expand("~/.pyenv/shims/python3"),
  node = vim.fn.expand("~/.fnm/node-versions/v16.13.1/installation/lib/node_modules/neovim/bin/cli.js"),
}

-- *******************************
-- Init
-- *******************************
for provider, path in pairs(providers) do
  vim.g[provider .. "_host_prog"] = path
end
