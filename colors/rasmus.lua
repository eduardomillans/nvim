--[[**************************************************
   * Rasmus Custom                                   *
   *                                                 *
   * Credits: https://github.com/kvrohit/rasmus.nvim *
   *************************************************]]

local hi = require("nv.utils").hi

-- Colors
local colors = {
  -- Primary
  bg = "#1d1d1d",
  fg = "#c9c9c9",

  -- Basic
  black = "#333332",
  red = "#ff968c",
  green = "#61957f",
  yellow = "#ffc591",
  blue = "#8db4d4",
  magenta = "#de9bc8",
  cyan = "#7bb099",
  white = "#d1d1d1",

  -- Grays
  gray01 = "#242424",
  gray02 = "#3a3a3a",
  gray03 = "#323231",
  gray04 = "#6a6a69",
  gray05 = "#767675",
  gray06 = "#b6b6b5",

  -- Special
  none = "NONE",
}

-- Styles
local styles = {
  bold = "bold",
  italic = "italic",
  reverse = "reverse",
  underline = "underline",
  none = "NONE",
}

-- Reset syntax
vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Terminal
local terminal = {
  colors.black,
  colors.red,
  colors.green,
  colors.yellow,
  colors.blue,
  colors.magenta,
  colors.cyan,
  colors.white,
  colors.bg,
  colors.red,
  colors.green,
  colors.yellow,
  colors.blue,
  colors.magenta,
  colors.cyan,
  colors.white,
}

-- Groups
local groups = {
  -- General
  ColorColumn = { bg = colors.gray01 },
  Conceal = { fg = colors.gray04 },
  Cursor = { fg = colors.cyan },
  CursorColumn = { bg = colors.fg },
  CursorLine = { bg = colors.gray03 },
  CursorLineNr = { fg = colors.gray04 },
  Directory = { fg = colors.blue },
  ErrorMsg = { fg = colors.red, bg = colors.none },
  WarningMsg = { fg = colors.yellow, bg = colors.none },
  FloatBorder = { fg = colors.fg, bg = colors.none },
  Folded = { fg = colors.gray04, bg = colors.none, gui = styles.italic },
  LineNr = { fg = colors.gray04 },
  MatchParen = { fg = colors.yellow, bg = colors.none },
  ModeMsg = { fg = colors.fg },
  MoreMsg = "ModeMsg",
  NonText = { fg = colors.gray03 },
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.gray01 },
  NormalNC = "Normal",
  Pmenu = { fg = colors.gray06, bg = colors.gray01 },
  PmenuSbar = { bg = colors.gray01 },
  PmenuSel = { fg = colors.bg, bg = colors.gray06 },
  PmenuThumb = { bg = colors.gray06 },
  Question = { fg = colors.fg },
  QuickFixLine = { fg = colors.fg, bg = colors.gray03 },
  Search = { fg = colors.none, bg = colors.none, gui = styles.reverse },
  SignColumn = { fg = colors.gray04, bg = colors.bg },
  SpecialKey = { fg = colors.gray03 },
  StatusLine = { fg = colors.fg, bg = colors.gray01, gui = styles.none },
  StatusLineNC = { fg = colors.fg, bg = colors.gray01, gui = styles.none },
  TabLine = { fg = colors.gray06, bg = colors.gray01, gui = styles.none },
  TabLineFill = { fg = colors.gray01, bg = colors.gray01 },
  TabLineSel = { fg = colors.gray06, bg = colors.gray01, gui = styles.italic },
  Title = { fg = colors.magenta, bg = colors.none },
  VertSplit = { fg = colors.gray01, bg = colors.gray01, gui = styles.none },
  Visual = { bg = colors.gray03 },
  WildMenu = { fg = colors.bg, bg = colors.blue },

  -- Units
  Boolean = { fg = colors.cyan, gui = styles.italic },
  Character = { fg = colors.cyan },
  Comment = { fg = colors.gray04, gui = styles.italic },
  Conditional = { fg = colors.blue, gui = styles.italic },
  Constant = { fg = colors.cyan },
  Debug = { fg = colors.red },
  Define = { fg = colors.cyan },
  Delimiter = { fg = colors.gray06 },
  Error = { fg = colors.red, bg = colors.none },
  Exception = { fg = colors.yellow },
  Float = { fg = colors.cyan },
  Function = { fg = colors.blue, gui = styles.italic },
  Identifier = { fg = colors.blue },
  Ignore = { fg = colors.gray06 },
  Include = { fg = colors.blue },
  Keyword = { fg = colors.blue, gui = styles.italic },
  Label = { fg = colors.cyan },
  Macro = { fg = colors.blue },
  Number = { fg = colors.cyan },
  Operator = { fg = colors.yellow },
  PreCondit = { fg = colors.cyan },
  PreProc = { fg = colors.red },
  Repeat = { fg = colors.blue, gui = styles.italic },
  Special = { fg = colors.blue, gui = styles.italic },
  SpecialChar = { fg = colors.cyan },
  SpecialComment = { fg = colors.blue },
  Statement = { fg = colors.blue },
  StorageClass = { fg = colors.cyan },
  String = { fg = colors.cyan },
  Structure = { fg = colors.fg },
  Tag = { fg = colors.yellow },
  Todo = { fg = colors.magenta, bg = colors.none, gui = styles.italic },
  Type = { fg = colors.cyan },
  Typedef = { fg = colors.cyan },
  Underlined = { fg = colors.cyan, gui = styles.underline },

  -- Statusline
  StatusLineA = { fg = colors.bg, bg = colors.gray06 },
  StatusLineAS = { fg = colors.gray06, bg = colors.gray02 },
  StatusLineB = { fg = colors.fg, bg = colors.gray02 },
  StatusLineBS = { fg = colors.gray02, bg = colors.gray01 },
  StatusLineC = "StatusLine",

  -- Git
  DiffAdd = { fg = colors.green, bg = colors.none },
  DiffChange = { fg = colors.yellow, bg = colors.none },
  DiffDelete = { fg = colors.red, bg = colors.none },
  DiffText = { fg = colors.fg, bg = colors.none },
  DiffAdded = "DiffAdd",
  DiffChangeD = "DiffChange",
  DiffRemoved = "DiffRemove",

  -- Diagnostics
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.blue },
  DiagnosticHint = { fg = colors.cyan },
  DiagnosticUnderlineError = { gui = styles.undercurl, sp = colors.red },
  DiagnosticUnderlineWarn = { gui = styles.undercurl, sp = colors.yellow },
  DiagnosticUnderlineInformation = { gui = styles.undercurl, sp = colors.blue },
  DiagnosticUnderlineHint = { gui = styles.undercurl, sp = colors.cyan },

  LspDiagnosticsDefaultError = "DiagnosticError",
  LspDiagnosticsDefaultWarning = "DiagnosticWarn",
  LspDiagnosticsDefaultInformation = "DiagnosticInfo",
  LspDiagnosticsDefaultHint = "DiagnosticHint",
  LspDiagnosticsUnderlineError = "DiagnosticUnderlineError",
  LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning",
  LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation",
  LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint",

  -- Markdown
  markdownH1 = { fg = colors.white },
  markdownH2 = { fg = colors.white },
  markdownH3 = { fg = colors.white },
  markdownH4 = { fg = colors.white },
  markdownH5 = { fg = colors.white },
  markdownH6 = { fg = colors.white },
  markdownHeadingDelimiter = { fg = colors.gray04 },
  markdownHeadingRule = { fg = colors.gray04 },
  markdownId = { fg = colors.cyan },
  markdownIdDeclaration = { fg = colors.blue },
  markdownIdDelimiter = { fg = colors.cyan },
  markdownLinkDelimiter = { fg = colors.gray04 },
  markdownLinkText = { fg = colors.white, gui = styles.italic },
  markdownListMarker = { fg = colors.yellow },
  markdownOrderedListMarker = { fg = colors.yellow },
  markdownRule = { fg = colors.gray04 },
  markdownUrl = { fg = colors.gray05 },
  markdownBlockquote = { fg = colors.gray06 },
  markdownBold = { fg = colors.fg },
  markdownItalic = { fg = colors.fg, gui = styles.italic },
  markdownCode = { fg = colors.fg, bg = colors.gray02 },
  markdownCodeBlock = { fg = colors.fg, bg = colors.gray02 },
  markdownCodeDelimiter = { fg = colors.fg, bg = colors.gray02 },

  -- TreeSitter highlight groups
  TSAnnotation = { fg = colors.green },
  TSAttribute = { fg = colors.fg },
  TSBoolean = { fg = colors.yellow, gui = styles.italic },
  TSCharacter = { fg = colors.cyan },
  TSComment = { fg = colors.gray04, gui = styles.italic },
  TSConditional = { fg = colors.blue, gui = styles.italic },
  TSConstBuiltin = { fg = colors.cyan, gui = styles.italic },
  TSConstMacro = { fg = colors.cyan },
  TSConstant = { fg = colors.blue },
  TSConstructor = { fg = colors.gray06 },
  TSDanger = { fg = colors.red, gui = styles.italic },
  TSEmphasis = { fg = colors.white },
  TSEnvironment = { fg = colors.blue },
  TSEnvironmentName = { fg = colors.blue },
  TSError = { fg = colors.red },
  TSException = { fg = colors.yellow },
  TSField = { fg = colors.fg },
  TSFloat = { fg = colors.cyan },
  TSFuncBuiltin = { fg = colors.fg, gui = styles.italic },
  TSFuncMacro = { fg = colors.blue },
  TSFunction = { fg = colors.fg, gui = styles.italic },
  TSInclude = { fg = colors.blue, gui = styles.italic },
  TSKeyword = { fg = colors.blue, gui = styles.italic },
  TSKeywordFunction = { fg = colors.blue, gui = styles.italic },
  TSKeywordOperator = { fg = colors.yellow },
  TSKeywordReturn = { fg = colors.blue, gui = styles.italic },
  TSLabel = { fg = colors.yellow },
  TSLiteral = { fg = colors.fg },
  TSMath = { fg = colors.blue },
  TSMethod = { fg = colors.blue, gui = styles.italic },
  TSNamespace = { fg = colors.blue },
  TSNone = { fg = colors.fg },
  TSNote = { fg = colors.blue, gui = styles.italic },
  TSNumber = { fg = colors.cyan },
  TSOperator = { fg = colors.yellow },
  TSParameter = { fg = colors.fg },
  TSParameterReference = { fg = colors.fg },
  TSProperty = { fg = colors.blue },
  TSPunctBracket = { fg = colors.fg },
  TSPunctDelimiter = { fg = colors.fg },
  TSPunctSpecial = { fg = colors.green },
  TSRepeat = { fg = colors.blue, gui = styles.italic },
  TSStrike = { fg = colors.bg, gui = styles.strikethrough },
  TSString = { fg = colors.cyan },
  TSStringEscape = { fg = colors.cyan },
  TSStringRegex = { fg = colors.green },
  TSStringSpecial = { fg = colors.green },
  TSStrong = { fg = colors.white },
  TSSymbol = { fg = colors.green },
  TSTag = { fg = colors.yellow },
  TSTagAttribute = { fg = colors.fg, gui = styles.italic },
  TSTagDelimiter = "TSTag",
  TSText = { fg = colors.fg },
  TSTextReference = { fg = colors.yellow },
  TSTitle = { fg = colors.fg },
  TSType = { fg = colors.fg },
  TSTypeBuiltin = { fg = colors.blue },
  TSURI = { fg = colors.cyan },
  TSUnderline = { fg = colors.white, gui = styles.underline },
  TSVariable = { fg = colors.fg },
  TSVariableBuiltin = { fg = colors.yellow },
  TSWarning = { fg = colors.yellow, gui = styles.italic },

  -- Telescope
  TelescopePromptPrefix = "TelescopePromptTitle",
  TelescopeMatching = { fg = colors.blue },

  -- Cmp
  CmpItemAbbrMatch = { fg = colors.fg },
  CmpItemAbbrMatchFuzzy = { fg = colors.fg },
  CmpItemAbbrDeprecated = { fg = colors.fg },
  -- Fidget
  FidgetTitle = { fg = colors.blue, gui = styles.italic },
  FidgetTask = { fg = colors.gray04, gui = styles.italic },

  -- Maximizer
  MaximizerWin = { fg = colors.fg, bg = colors.bg },
  MaximizerTitle = { fg = colors.magenta, gui = styles.italic },
}

-- Set theme
for index, color in ipairs(terminal) do
  vim.g[("terminal_color_%d"):format(index - 1)] = color
end

for group, args in pairs(groups) do
  hi(group, args)
end
