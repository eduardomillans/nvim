--[[*************************************************
   * I just wanted `Tomorrow Night`                 *
   *                                                *
   *  FROM: https://github.com/RRethy/nvim-base16   *
   **************************************************]]

-- Reset syntax
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Colors
local colors = {
  base00 = "#1d1f21",
  base01 = "#282a2e",
  base02 = "#373b41",
  base03 = "#787a78",
  base04 = "#b4b7b4",
  base05 = "#c1c3c1",
  base06 = "#e0e0e0",
  base07 = "#ffffff",
  base08 = "#cc6666",
  base09 = "#de935f",
  base0A = "#f0c674",
  base0B = "#b5bd68",
  base0C = "#8abeb7",
  base0D = "#81a2be",
  base0E = "#b294bb",
  base0F = "#a3685a",
}

-- Highight wrapper
local hi = setmetatable({}, {
  __newindex = function(_, group, args)
    if type(args) == "string" then
      vim.cmd(("hi! link %s %s"):format(group, args))
      return
    end

    local highlight = { "hi", group }

    if args.guifg then
      table.insert(highlight, ("guifg=%s"):format(args.guifg))
    end

    if args.guibg then
      table.insert(highlight, ("guibg=%s"):format(args.guibg))
    end

    if args.gui then
      table.insert(highlight, ("gui=%s"):format(args.gui))
    end

    if args.guisp then
      table.insert(highlight, ("guisp=%s"):format(args.guisp))
    end

    vim.cmd(table.concat(highlight, " "))
  end,
})

--- Set theme
vim.g.terminal_color_0 = colors.base00
vim.g.terminal_color_1 = colors.base08
vim.g.terminal_color_2 = colors.base0B
vim.g.terminal_color_3 = colors.base0A
vim.g.terminal_color_4 = colors.base0D
vim.g.terminal_color_5 = colors.base0E
vim.g.terminal_color_6 = colors.base0C
vim.g.terminal_color_7 = colors.base05
vim.g.terminal_color_8 = colors.base03
vim.g.terminal_color_9 = colors.base08
vim.g.terminal_color_10 = colors.base0B
vim.g.terminal_color_11 = colors.base0A
vim.g.terminal_color_12 = colors.base0D
vim.g.terminal_color_13 = colors.base0E
vim.g.terminal_color_14 = colors.base0C
vim.g.terminal_color_15 = colors.base07

hi.Normal = { guifg = colors.base05, guibg = colors.base00, gui = nil, guisp = nil }
hi.NormalNC = { guifg = colors.base05, guibg = colors.base00, gui = nil, guisp = nil }
hi.Bold = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }
hi.Debug = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.Directory = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.Error = { guifg = colors.base05, guibg = colors.base00, gui = nil, guisp = nil }
hi.ErrorMsg = { guifg = colors.base08, guibg = colors.base00, gui = nil, guisp = nil }
hi.Exception = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.FoldColumn = { guifg = colors.base0C, guibg = colors.base00, gui = nil, guisp = nil }
hi.Folded = { guifg = colors.base03, guibg = colors.base01, gui = nil, guisp = nil }
hi.IncSearch = { guifg = colors.base01, guibg = colors.base09, gui = nil, guisp = nil }
hi.Macro = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.MatchParen = { guifg = nil, guibg = colors.base03, gui = nil, guisp = nil }
hi.ModeMsg = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.MoreMsg = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.Question = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.Search = { guifg = colors.base01, guibg = colors.base0A, gui = nil, guisp = nil }
hi.Substitute = { guifg = colors.base01, guibg = colors.base0A, gui = nil, guisp = nil }
hi.SpecialKey = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.TooLong = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.Underlined = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.Visual = { guifg = nil, guibg = colors.base02, gui = nil, guisp = nil }
hi.VisualNOS = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.WarningMsg = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.WildMenu = { guifg = colors.base08, guibg = colors.base0A, gui = nil, guisp = nil }
hi.Title = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.Conceal = { guifg = colors.base0D, guibg = colors.base00, gui = nil, guisp = nil }
hi.Cursor = { guifg = colors.base00, guibg = colors.base05, gui = nil, guisp = nil }
hi.NonText = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.LineNr = { guifg = colors.base03, guibg = colors.base00, gui = nil, guisp = nil }
hi.SignColumn = { guifg = colors.base04, guibg = colors.base00, gui = nil, guisp = nil }
hi.StatusLine = { guifg = colors.base05, guibg = colors.base01, gui = "none", guisp = nil }
hi.StatusLineNC = { guifg = colors.base05, guibg = colors.base01, gui = "none", guisp = nil }
hi.VertSplit = { guifg = colors.base05, guibg = colors.base01, gui = "none", guisp = nil }
hi.ColorColumn = { guifg = nil, guibg = colors.base01, gui = nil, guisp = nil }
hi.CursorColumn = { guifg = nil, guibg = colors.base01, gui = nil, guisp = nil }
hi.CursorLine = { guifg = nil, guibg = colors.base01, gui = nil, guisp = nil }
hi.CursorLineNr = { guifg = colors.base03, guibg = colors.base01, gui = nil, guisp = nil }
hi.QuickFixLine = { guifg = nil, guibg = colors.base01, gui = nil, guisp = nil }
hi.Pmenu = { guifg = colors.base05, guibg = colors.base01, gui = nil, guisp = nil }
hi.PmenuSel = { guifg = colors.base01, guibg = colors.base05, gui = nil, guisp = nil }
hi.PmenuSbar = { guifg = colors.base05, guibg = colors.base01, gui = nil, guisp = nil }
hi.PmenuThumb = { guifg = colors.base01, guibg = colors.base05, gui = nil, guisp = nil }
hi.TabLine = { guifg = colors.base03, guibg = colors.base01, gui = "none", guisp = nil }
hi.TabLineFill = { guifg = colors.base01, guibg = colors.base01, gui = nil, guisp = nil }
hi.TabLineSel = { guifg = colors.base0B, guibg = colors.base01, gui = nil, guisp = nil }
hi.NormalFloat = { guifg = colors.base04, guibg = colors.base01, gui = nil, guisp = nil }
hi.FloatBorder = { guifg = colors.base04, guibg = colors.base00, gui = nil, guisp = nil }

hi.Boolean = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.Character = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.Comment = { guifg = colors.base03, guibg = nil, gui = "italic", guisp = nil }
hi.Conditional = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.Constant = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.Define = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.Delimiter = { guifg = colors.base0F, guibg = nil, gui = nil, guisp = nil }
hi.Float = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.Function = { guifg = colors.base0D, guibg = nil, gui = "italic", guisp = nil }
hi.Identifier = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.Include = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.Keyword = { guifg = colors.base0E, guibg = nil, gui = "italic", guisp = nil }
hi.Label = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.Number = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.Operator = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.PreProc = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.Repeat = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.Special = { guifg = colors.base0C, guibg = nil, gui = nil, guisp = nil }
hi.SpecialChar = { guifg = colors.base0F, guibg = nil, gui = nil, guisp = nil }
hi.Statement = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.StorageClass = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.String = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.Structure = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.Tag = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.Todo = { guifg = colors.base0A, guibg = colors.base01, gui = nil, guisp = nil }
hi.Type = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.Typedef = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }

hi.User1 = { guifg = colors.base08, guibg = colors.base02, gui = nil, guisp = nil }
hi.User2 = { guifg = colors.base0E, guibg = colors.base02, gui = nil, guisp = nil }
hi.User3 = { guifg = colors.base05, guibg = colors.base02, gui = nil, guisp = nil }
hi.User4 = { guifg = colors.base0C, guibg = colors.base02, gui = nil, guisp = nil }
hi.User5 = { guifg = colors.base01, guibg = colors.base02, gui = nil, guisp = nil }
hi.User6 = { guifg = colors.base05, guibg = colors.base02, gui = nil, guisp = nil }
hi.User7 = { guifg = colors.base05, guibg = colors.base02, gui = nil, guisp = nil }
hi.User8 = { guifg = colors.base00, guibg = colors.base02, gui = nil, guisp = nil }
hi.User9 = { guifg = colors.base00, guibg = colors.base02, gui = nil, guisp = nil }

hi.DiffAdd = { guifg = colors.base0B, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffChange = { guifg = colors.base03, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffDelete = { guifg = colors.base08, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffText = { guifg = colors.base0D, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffAdded = { guifg = colors.base0B, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffFile = { guifg = colors.base08, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffNewFile = { guifg = colors.base0B, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffLine = { guifg = colors.base0D, guibg = colors.base00, gui = nil, guisp = nil }
hi.DiffRemoved = { guifg = colors.base08, guibg = colors.base00, gui = nil, guisp = nil }

hi.htmlEndTag = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.htmlTag = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }

hi.gitcommitOverflow = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitSummary = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitComment = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitUntracked = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitDiscarded = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitSelected = { guifg = colors.base03, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitHeader = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitSelectedType = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitUnmergedType = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitDiscardedType = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitBranch = { guifg = colors.base09, guibg = nil, gui = "bold", guisp = nil }
hi.gitcommitUntrackedFile = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.gitcommitUnmergedFile = { guifg = colors.base08, guibg = nil, gui = "bold", guisp = nil }
hi.gitcommitDiscardedFile = { guifg = colors.base08, guibg = nil, gui = "bold", guisp = nil }
hi.gitcommitSelectedFile = { guifg = colors.base0B, guibg = nil, gui = "bold", guisp = nil }

hi.DiagnosticError = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.DiagnosticWarn = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.DiagnosticInfo = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.DiagnosticHint = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.DiagnosticUnderlineError = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base08 }
hi.DiagnosticUnderlineWarning = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0E }
hi.DiagnosticUnderlineWarn = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0E }
hi.DiagnosticUnderlineInformation = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0F }
hi.DiagnosticUnderlineHint = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0C }

hi.LspReferenceText = { guifg = nil, guibg = nil, gui = nil, guisp = colors.base04 }
hi.LspReferenceRead = { guifg = nil, guibg = nil, gui = nil, guisp = colors.base04 }
hi.LspReferenceWrite = { guifg = nil, guibg = nil, gui = nil, guisp = colors.base04 }
hi.LspDiagnosticsDefaultError = "DiagnosticError"
hi.LspDiagnosticsDefaultWarning = "DiagnosticWarn"
hi.LspDiagnosticsDefaultInformation = "DiagnosticInfo"
hi.LspDiagnosticsDefaultHint = "DiagnosticHint"
hi.LspDiagnosticsUnderlineError = "DiagnosticUnderlineError"
hi.LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning"
hi.LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation"
hi.LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint"

hi.TSAnnotation = { guifg = colors.base0F, guibg = nil, gui = nil, guisp = nil }
hi.TSAttribute = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSBoolean = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSCharacter = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSComment = { guifg = colors.base03, guibg = nil, gui = "italic", guisp = nil }
hi.TSConstructor = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSConditional = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.TSConstant = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSConstBuiltin = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSConstMacro = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSError = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSException = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSField = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSFloat = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSFunction = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSFuncBuiltin = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSFuncMacro = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSInclude = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSKeyword = { guifg = colors.base0E, guibg = nil, gui = "italic", guisp = nil }
hi.TSKeywordFunction = { guifg = colors.base0E, guibg = nil, gui = "italic", guisp = nil }
hi.TSKeywordOperator = { guifg = colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.TSLabel = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSMethod = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSNamespace = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSNone = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSNumber = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSOperator = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSParameter = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSParameterReference = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSProperty = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSPunctDelimiter = { guifg = colors.base0F, guibg = nil, gui = nil, guisp = nil }
hi.TSPunctBracket = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSPunctSpecial = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSRepeat = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSString = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.TSStringRegex = { guifg = colors.base0C, guibg = nil, gui = nil, guisp = nil }
hi.TSStringEscape = { guifg = colors.base0C, guibg = nil, gui = nil, guisp = nil }
hi.TSSymbol = { guifg = colors.base0B, guibg = nil, gui = nil, guisp = nil }
hi.TSTag = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSTagDelimiter = { guifg = colors.base0F, guibg = nil, gui = nil, guisp = nil }
hi.TSText = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSStrong = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }
hi.TSEmphasis = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSUnderline = { guifg = colors.base00, guibg = nil, gui = nil, guisp = nil }
hi.TSStrike = { guifg = colors.base00, guibg = nil, gui = "strikethrough", guisp = nil }
hi.TSTitle = { guifg = colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.TSLiteral = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSURI = { guifg = colors.base09, guibg = nil, gui = nil, guisp = nil }
hi.TSType = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSTypeBuiltin = { guifg = colors.base0A, guibg = nil, gui = nil, guisp = nil }
hi.TSVariable = { guifg = colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.TSVariableBuiltin = { guifg = colors.base08, guibg = nil, gui = nil, guisp = nil }
hi.TSDefinition = { guifg = nil, guibg = nil, gui = nil, guisp = colors.base04 }
hi.TSDefinitionUsage = { guifg = nil, guibg = nil, gui = nil, guisp = colors.base04 }
hi.TSCurrentScope = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }

hi.TreesitterContext = { guifg = nil, guibg = colors.base01, gui = nil, guisp = nil }

hi.TelescopeSelection = { guifg = colors.base08, guibg = colors.base00, gui = nil, guisp = nil }
hi.TelescopeMultiSelection = { guifg = colors.base0B, guibg = colors.base00, gui = nil, guisp = nil }
hi.TelescopeMatching = { guifg = "none", guibg = nil, gui = nil, guisp = nil }

hi.CmpItemAbbrMatch = { guifg = colors.base05, guibg = nil }
hi.CmpItemAbbrMatchFuzzy = { guifg = colors.base05, guibg = nil }
hi.CmpItemAbbrDeprecated = { guifg = colors.base05, guibg = nil }
