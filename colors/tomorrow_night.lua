--[[*************************************************
   * I just wanted `Tomorrow Night`                 *
   *                                                *
   * FROM: https://github.com/RRethy/nvim-base16    *
   **************************************************]]

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

-- Styles
local styles = {
  bold = "bold",
  underline = "underline",
  underlineline = "underlineline",
  undercurl = "undercurl",
  underdot = "underdot",
  underdash = "underdash",
  strikethrough = "strikethrough",
  reverse = "reverse",
  inverse = "inverse",
  italic = "italic",
  standout = "standout",
  nocombine = "nocombine",
  none = "NONE",
}

-- Reset syntax
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Highlight wrapper
local hi = function(group, args)
  if type(args) == "string" then
    vim.cmd(("hi! link %s %s"):format(group, args))
    return
  end

  local highlight = { "hi!", group }

  for k, v in pairs(args) do
    k = k:gsub("gui", "")
    table.insert(highlight, ("gui%s=%s"):format(k, v))
  end

  vim.cmd(table.concat(highlight, " "))
end

-- Terminal
local terminal = {
  colors.base00,
  colors.base08,
  colors.base0B,
  colors.base0A,
  colors.base0D,
  colors.base0E,
  colors.base0C,
  colors.base05,
  colors.base03,
  colors.base08,
  colors.base0B,
  colors.base0A,
  colors.base0D,
  colors.base0E,
  colors.base0C,
  colors.base07,
}

-- Groups
local groups = {
  -- General
  Normal = { fg = colors.base05, bg = colors.base00 },
  NormalNC = { fg = colors.base05, bg = colors.base00 },
  Bold = { gui = styles.bold },
  Debug = { fg = colors.base08 },
  Directory = { fg = colors.base0D },
  Error = { fg = colors.base05, bg = colors.base00 },
  ErrorMsg = { fg = colors.base08, bg = colors.base00 },
  Exception = { fg = colors.base08 },
  FoldColumn = { fg = colors.base0C, bg = colors.base00 },
  Folded = { fg = colors.base03, bg = colors.base01, gui = styles.italic },
  IncSearch = { fg = colors.base01, bg = colors.base09 },
  Macro = { fg = colors.base08 },
  MatchParen = { bg = colors.base03 },
  ModeMsg = { fg = colors.base0B },
  MoreMsg = { fg = colors.base0B },
  Question = { fg = colors.base0D },
  Search = { fg = colors.base01, bg = colors.base0A },
  Substitute = { fg = colors.base01, bg = colors.base0A },
  SpecialKey = { fg = colors.base03 },
  TooLong = { fg = colors.base08 },
  Underlined = { fg = colors.base08 },
  Visual = { bg = colors.base02 },
  VisualNOS = { fg = colors.base08 },
  WarningMsg = { fg = colors.base08 },
  WildMenu = { fg = colors.base08, bg = colors.base0A },
  Title = { fg = colors.base0D },
  Conceal = { fg = colors.base0D, bg = colors.base00 },
  Cursor = { fg = colors.base00, bg = colors.base05 },
  NonText = { fg = colors.base03 },
  LineNr = { fg = colors.base03, bg = colors.base00 },
  SignColumn = { fg = colors.base04, bg = colors.base00 },
  StatusLine = { fg = colors.base05, bg = colors.base01, gui = styles.none },
  StatusLineNC = { fg = colors.base05, bg = colors.base01, gui = styles.none },
  VertSplit = { fg = colors.base05, bg = colors.base01, gui = styles.none },
  ColorColumn = { bg = colors.base01 },
  CursorColumn = { bg = colors.base01 },
  CursorLine = { bg = colors.base01 },
  CursorLineNr = { fg = colors.base03, bg = colors.base01 },
  QuickFixLine = { bg = colors.base01 },
  Pmenu = { fg = colors.base05, bg = colors.base01 },
  PmenuSel = { fg = colors.base01, bg = colors.base05 },
  PmenuSbar = { fg = colors.base05, bg = colors.base01 },
  PmenuThumb = { fg = colors.base01, bg = colors.base05 },
  TabLine = { fg = colors.base03, bg = colors.base01, gui = styles.none },
  TabLineFill = { fg = colors.base01, bg = colors.base01 },
  TabLineSel = { fg = colors.base0B, bg = colors.base01 },
  NormalFloat = { fg = colors.base04, bg = colors.base01 },
  FloatBorder = { fg = colors.base04, bg = colors.base00 },

  -- Unit
  Boolean = { fg = colors.base09 },
  Character = { fg = colors.base08 },
  Comment = { fg = colors.base03, gui = styles.italic },
  Conditional = { fg = colors.base0E, gui = styles.italic },
  Constant = { fg = colors.base09 },
  Define = { fg = colors.base0E },
  Delimiter = { fg = colors.base0F },
  Float = { fg = colors.base09 },
  Function = { fg = colors.base0D, gui = styles.italic },
  Identifier = { fg = colors.base05, gui = styles.italic },
  Include = { fg = colors.base0D },
  Keyword = { fg = colors.base0E, gui = styles.italic },
  Label = { fg = colors.base0A },
  Number = { fg = colors.base09 },
  Operator = { fg = colors.base0D },
  PreProc = { fg = colors.base0A },
  Repeat = { fg = colors.base0A, gui = styles.italic },
  Special = { fg = colors.base0C },
  SpecialChar = { fg = colors.base0F },
  Statement = { fg = colors.base08 },
  StorageClass = { fg = colors.base0A },
  String = { fg = colors.base0B },
  Structure = { fg = colors.base0E },
  Tag = { fg = colors.base0A },
  Todo = { fg = colors.base0A, bg = colors.base01, gui = styles.italic },
  Type = { fg = colors.base0A },
  Typedef = { fg = colors.base0A },

  -- Statusline
  StatusLineA = { fg = colors.base00, bg = colors.base0D },
  StatusLineAS = { fg = colors.base0D, bg = "#373B41" },
  StatusLineB = { fg = colors.base05, bg = "#373B41" },
  StatusLineBS = { fg = "#373B41", bg = colors.base01 },
  StatusLineC = "StatusLine",

  -- Git
  DiffAdd = { fg = colors.base0B, bg = colors.base00 },
  DiffChange = { fg = colors.base03, bg = colors.base00 },
  DiffDelete = { fg = colors.base08, bg = colors.base00 },
  DiffText = { fg = colors.base0D, bg = colors.base00 },
  DiffAdded = { fg = colors.base0B, bg = colors.base00 },
  DiffFile = { fg = colors.base08, bg = colors.base00 },
  DiffNewFile = { fg = colors.base0B, bg = colors.base00 },
  DiffLine = { fg = colors.base0D, bg = colors.base00 },
  DiffRemoved = { fg = colors.base08, bg = colors.base00 },

  gitcommitOverflow = { fg = colors.base08 },
  gitcommitSummary = { fg = colors.base0B },
  gitcommitComment = { fg = colors.base03 },
  gitcommitUntracked = { fg = colors.base03 },
  gitcommitDiscarded = { fg = colors.base03 },
  gitcommitSelected = { fg = colors.base03 },
  gitcommitHeader = { fg = colors.base0E },
  gitcommitSelectedType = { fg = colors.base0D },
  gitcommitUnmergedType = { fg = colors.base0D },
  gitcommitDiscardedType = { fg = colors.base0D },
  gitcommitBranch = { fg = colors.base09, gui = styles.bold },
  gitcommitUntrackedFile = { fg = colors.base0A },
  gitcommitUnmergedFile = { fg = colors.base08, gui = styles.bold },
  gitcommitDiscardedFile = { fg = colors.base08, gui = styles.bold },
  gitcommitSelectedFile = { fg = colors.base0B, gui = styles.bold },

  -- Diagnostics
  DiagnosticError = { fg = colors.base08 },
  DiagnosticWarn = { fg = colors.base0A },
  DiagnosticInfo = { fg = colors.base0D },
  DiagnosticHint = { fg = colors.base0E },
  DiagnosticUnderlineError = { gui = styles.undercurl, sp = colors.base08 },
  DiagnosticUnderlineWarning = { gui = styles.undercurl, sp = colors.base0E },
  DiagnosticUnderlineWarn = { gui = styles.undercurl, sp = colors.base0E },
  DiagnosticUnderlineInformation = { gui = styles.undercurl, sp = colors.base0F },
  DiagnosticUnderlineHint = { gui = styles.undercurl, sp = colors.base0C },

  LspReferenceText = { sp = colors.base04 },
  LspReferenceRead = { sp = colors.base04 },
  LspReferenceWrite = { sp = colors.base04 },
  LspDiagnosticsDefaultError = "DiagnosticError",
  LspDiagnosticsDefaultWarning = "DiagnosticWarn",
  LspDiagnosticsDefaultInformation = "DiagnosticInfo",
  LspDiagnosticsDefaultHint = "DiagnosticHint",
  LspDiagnosticsUnderlineError = "DiagnosticUnderlineError",
  LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning",
  LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation",
  LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint",

  -- Html
  htmlEndTag = { fg = colors.base05 },
  htmlTag = { fg = colors.base05 },

  -- Treesitter
  TSAnnotation = { fg = colors.base0F },
  TSAttribute = { fg = colors.base0A },
  TSBoolean = { fg = colors.base09 },
  TSCharacter = { fg = colors.base08, gui = styles.italic },
  TSComment = { fg = colors.base03, gui = styles.italic },
  TSConstructor = { fg = colors.base0D },
  TSConditional = { fg = colors.base0E, gui = styles.italic },
  TSConstant = { fg = colors.base09 },
  TSConstBuiltin = { fg = colors.base09 },
  TSConstMacro = { fg = colors.base08 },
  TSError = { fg = colors.base08 },
  TSException = { fg = colors.base08 },
  TSField = { fg = colors.base05 },
  TSFloat = { fg = colors.base09 },
  TSFunction = { fg = colors.base0D },
  TSFuncBuiltin = { fg = colors.base0D, gui = styles.italic },
  TSFuncMacro = { fg = colors.base08 },
  TSInclude = { fg = colors.base0E, gui = styles.italic },
  TSKeyword = { fg = colors.base0E, gui = styles.italic },
  TSKeywordFunction = { fg = colors.base0E, gui = styles.italic },
  TSKeywordReturn = { fg = colors.base0E, gui = styles.italic },
  TSKeywordOperator = { fg = colors.base0C },
  TSLabel = { fg = colors.base0A },
  TSMethod = { fg = colors.base0D },
  TSNamespace = { fg = colors.base08, gui = styles.italic },
  TSNone = { fg = colors.base05 },
  TSNumber = { fg = colors.base09 },
  TSOperator = { fg = colors.base08 },
  TSParameter = { fg = colors.base09 },
  TSParameterReference = { fg = colors.base05 },
  TSProperty = { fg = colors.base05 },
  TSPunctDelimiter = { fg = colors.base0F },
  TSPunctBracket = { fg = colors.base05 },
  TSPunctSpecial = { fg = colors.base05 },
  TSRepeat = { fg = colors.base0A, gui = styles.italic },
  TSString = { fg = colors.base0B },
  TSStringRegex = { fg = colors.base0C, gui = styles.italic },
  TSStringEscape = { fg = colors.base0C, gui = styles.italic },
  TSSymbol = { fg = colors.base0B },
  TSTag = { fg = colors.base08 },
  TSTagAttribute = { fg = colors.base0E, gui = styles.italic },
  TSTagDelimiter = { fg = colors.base0F },
  TSText = { fg = colors.base05 },
  TSStrong = { gui = styles.bold },
  TSEmphasis = { fg = colors.base09 },
  TSUnderline = { fg = colors.base00 },
  TSStrike = { fg = colors.base00, gui = styles.strikethrough },
  TSTitle = { fg = colors.base0D },
  TSLiteral = { fg = colors.base09 },
  TSURI = { fg = colors.base09 },
  TSType = { fg = colors.base0A },
  TSTypeBuiltin = { fg = colors.base0A },
  TSVariable = { fg = colors.base05 },
  TSVariableBuiltin = { fg = colors.base08 },
  TSDefinition = { sp = colors.base04 },
  TSDefinitionUsage = { sp = colors.base04 },
  TSCurrentScope = { gui = styles.bold },

  TreesitterContext = { bg = colors.base01 },

  -- Telescope
  TelescopePromptPrefix = "TelescopePromptTitle",
  TelescopeMatching = { fg = colors.base0D },

  -- Cmp
  CmpItemAbbrMatch = { fg = colors.base05 },
  CmpItemAbbrMatchFuzzy = { fg = colors.base05 },
  CmpItemAbbrDeprecated = { fg = colors.base05 },

  -- Fidget
  FidgetTitle = { fg = colors.base0E, gui = styles.italic },

  -- Maximizer
  MaximizerWin = { fg = colors.base05, bg = colors.base00 },
  MaximizerTitle = { fg = colors.base0E, gui = styles.italic },
}

-- Set theme
for index, color in ipairs(terminal) do
  vim.g[("terminal_color_%d"):format(index - 1)] = color
end

for group, args in pairs(groups) do
  hi(group, args)
end
