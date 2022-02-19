local should_update_capabilities, cmp = pcall(require, "cmp_nvim_lsp")
local utils = require("nv.utils")

local map = utils.map

local M = {}

-- *******************************
-- Lsp on attach
-- *******************************
M.get_on_attach = function(enable_formatting)
  return function(client, bufnr)
    if not enable_formatting then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Set keymaps
    local keymaps = {
      map("n", "gd", "lua vim.lsp.buf.definition()", { "cmd", "silent", "noremap" }),
      map("n", "gh", 'lua require("nv.lsp.handlers").hover()', { "cmd", "silent", "noremap" }),
      map("n", ",gh", "lua vim.diagnostic.open_float()", { "cmd", "silent", "noremap" }),
      map("n", "gi", "lua vim.lsp.buf.implementation()", { "cmd", "silent", "noremap" }),
      map("n", "gs", 'lua require("nv.lsp.handlers").signature_help()', { "cmd", "silent", "noremap" }),
      map("n", "gy", "lua vim.lsp.buf.type_defenition()", { "cmd", "silent", "noremap" }),
      map("n", "gr", "lua vim.lsp.buf.rename()", { "cmd", "silent", "noremap" }),
      map("n", "<M-CR>", "lua vim.lsp.buf.code_action()", { "cmd", "silent", "noremap" }),
      map("n", "gx", "lua vim.lsp.buf.references()", { "cmd", "silent", "noremap" }),
      map("n", ",gd", "lua vim.diagnostic.setqflist()", { "cmd", "silent", "noremap" }),
    }

    for _, keymap in ipairs(keymaps) do
      keymap:save()
    end

    -- Override diagnostic's config
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      float = {
        border = "rounded",
      },
      underline = false,
      severity_sort = true,
      update_in_insert = true,
    })

    for _, type in ipairs({ "Error", "Warn", "Hint", "Info" }) do
      local hl = ("DiagnosticSign%s"):format(type)
      vim.fn.sign_define(hl, { text = ">>", texthl = hl, numhl = hl })
    end
  end
end

-- *******************************
-- Lsp capabilities
-- *******************************
M.get_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  if should_update_capabilities then
    capabilities = cmp.update_capabilities(capabilities)
  end

  return capabilities
end

-- *******************************
-- Lua runtime
-- *******************************
M.get_lua_runtime = function()
  local lua_runtime = vim.split(package.path, ";")

  table.insert(lua_runtime, "lua/?.lua")
  table.insert(lua_runtime, "lua/?/init.lua")

  return lua_runtime
end

return M
