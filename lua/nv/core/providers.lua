-- Set providers
local providers = {
  python3 = vim.fn.expand("~/.pyenv/shims/python3"),
  node = vim.fn.expand("~/.fnm/node-versions/v16.13.1/installation/lib/node_modules/neovim/bin/cli.js"),
}

for provider, path in pairs(providers) do
  vim.g[("%s_host_prog"):format(provider)] = path
end
