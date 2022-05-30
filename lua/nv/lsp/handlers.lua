local M = {}

local stats = vim.api.nvim_list_uis()[1]
local maxwidth = math.ceil(stats.width > 175 and stats.width * 0.5 or stats.width * 0.35)
local maxheight = math.ceil(stats.height > 35 and stats.height * 0.25 or stats.height * 0.5)

-- Signature help
M.signature_help = function()
  local text = vim.fn.getline(".")
  local col = vim.fn.col(".")

  local params = vim.lsp.util.make_position_params()

  for i = col, #text do
    local ch = text:sub(i, i)

    if ch == "(" then
      params.position.character = i
      break
    elseif ch == " " then
      break
    end
  end

  vim.lsp.buf_request(0, "textDocument/signatureHelp", params, function(_, result, ctx, config)
    config = config or {}
    config.border = "rounded"
    config.focus_id = ctx.method
    config.max_width = maxwidth
    config.max_height = maxheight

    if not (result and result.signatures and result.signatures[1]) then
      if config.silent ~= true then
        print("No signature help available")
      end
      return
    end

    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local triggers = client.resolved_capabilities.signature_help_trigger_characters
    local ft = vim.api.nvim_buf_get_option(ctx.bufnr, "filetype")
    local content, hl = vim.lsp.util.convert_signature_help_to_markdown_lines(result, ft, triggers)
    content = vim.lsp.util.trim_empty_lines(content)

    if vim.tbl_isempty(content) then
      if config.silent ~= true then
        print("No signature help available")
      end
      return
    end

    local fbuf, fwin = vim.lsp.util.open_floating_preview(content, "markdown", config)

    if hl then
      vim.api.nvim_buf_add_highlight(fbuf, -1, "LspSignatureActiveParameter", 0, unpack(hl))
    end

    return fbuf, fwin
  end)
end

-- Hover
M.hover = function()
  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, "textDocument/hover", params, function(_, result, ctx, config)
    config = config or {}
    config.border = "rounded"
    config.focus_id = ctx.method
    config.max_width = maxwidth
    config.max_height = maxheight

    if not (result and result.contents) then
      return
    end

    local content = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    content = vim.lsp.util.trim_empty_lines(content)

    if vim.tbl_isempty(content) then
      return
    end

    return vim.lsp.util.open_floating_preview(content, "markdown", config)
  end)
end

return M
