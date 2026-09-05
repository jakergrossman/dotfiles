-- gruber-highlighter.nvim
-- An inverted Gruber Darker: black text on a light page, with syntax
-- elements wearing colored highlighter backgrounds.
--
-- Install: drop this file at ~/.config/nvim/colors/gruber-highlighter.lua
-- Use:     :colorscheme gruber-highlighter

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "light"
vim.g.colors_name = "gruber-highlighter"

-- ---------------------------------------------------------------------------
-- Palette
-- ---------------------------------------------------------------------------
local c = {
  -- page
  bg          = "#f6f6f2", -- paper
  bg_alt      = "#ecece6", -- slightly darker paper (cursorline, statusline)
  bg_dark     = "#dedeD6", -- visual selection / column lines
  fg          = "#000000", -- ink
  fg_dim      = "#3a3a3a",
  fg_faint    = "#6b6b6b",
  rule        = "#c8c8c0", -- splits, borders

  -- highlighter ink (dark variants, used sparingly for accents/errors)
  ink_red     = "#a01b1b",
  ink_green   = "#246b1f",
  ink_blue    = "#1f3a8a",

  -- highlighter swatches (light, saturated, like real highlighter pens)
  hl_yellow   = "#fff3a8", -- gruber yellow  -> classic highlighter
  hl_orange   = "#ffd9a8", -- gruber brown
  hl_red      = "#ffc4c8", -- gruber red
  hl_pink     = "#ffc8e4",
  hl_green    = "#c8e8b0", -- gruber green
  hl_mint     = "#bfe9d4", -- gruber quartz
  hl_blue     = "#c8d4ec", -- gruber niagara
  hl_purple   = "#dcd2ec", -- gruber wisteria
}

-- ---------------------------------------------------------------------------
-- helper
-- ---------------------------------------------------------------------------
local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

-- ---------------------------------------------------------------------------
-- UI
-- ---------------------------------------------------------------------------
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg_alt })
hi("FloatBorder",  { fg = c.rule, bg = c.bg_alt })
hi("FloatTitle",   { fg = c.fg, bg = c.hl_yellow, bold = true })

hi("Cursor",       { fg = c.bg, bg = c.fg })
hi("CursorLine",   { bg = c.bg_alt })
hi("CursorColumn", { bg = c.bg_alt })
hi("ColorColumn",  { bg = c.bg_dark })
hi("LineNr",       { fg = c.fg_faint, bg = c.bg })
hi("CursorLineNr", { fg = c.fg, bg = c.bg_alt, bold = true })
hi("SignColumn",   { bg = c.bg })
hi("Folded",       { fg = c.fg_dim, bg = c.bg_alt, italic = true })
hi("FoldColumn",   { fg = c.fg_faint, bg = c.bg })

hi("VertSplit",    { fg = c.rule, bg = c.bg })
hi("WinSeparator", { fg = c.rule, bg = c.bg })

hi("StatusLine",   { fg = c.fg, bg = c.bg_dark })
hi("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hi("TabLine",      { fg = c.fg_dim, bg = c.bg_alt })
hi("TabLineSel",   { fg = c.fg, bg = c.hl_yellow, bold = true })
hi("TabLineFill",  { bg = c.bg_alt })

hi("Pmenu",        { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",     { fg = c.fg, bg = c.hl_yellow, bold = true })
hi("PmenuSbar",    { bg = c.bg_dark })
hi("PmenuThumb",   { bg = c.fg_faint })

hi("Visual",       { bg = c.hl_blue })
hi("VisualNOS",    { bg = c.hl_blue })
hi("Search",       { fg = c.fg, bg = c.hl_yellow, bold = true })
hi("CurSearch",    { fg = c.fg, bg = c.hl_orange, bold = true })
hi("IncSearch",    { fg = c.fg, bg = c.hl_orange, bold = true })
hi("MatchParen",   { fg = c.fg, bg = c.hl_pink, bold = true })

hi("Directory",    { fg = c.fg, bg = c.hl_blue, bold = true })
hi("Title",        { fg = c.fg, bold = true })
hi("Question",     { fg = c.fg, bg = c.hl_green })
hi("ModeMsg",      { fg = c.fg, bold = true })
hi("MoreMsg",      { fg = c.fg, bold = true })
hi("WarningMsg",   { fg = c.fg, bg = c.hl_orange, bold = true })
hi("ErrorMsg",     { fg = c.fg, bg = c.hl_red, bold = true })

hi("NonText",      { fg = "#d8c8c0" })
hi("Whitespace",   { fg = "#d8c8c0" })
hi("SpecialKey",   { fg = c.fg_faint })
hi("Conceal",      { fg = c.fg_faint })

hi("SpellBad",     { bg = c.hl_red,    undercurl = true })
hi("SpellCap",     { bg = c.hl_blue,   undercurl = true })
hi("SpellRare",    { bg = c.hl_purple, undercurl = true })
hi("SpellLocal",   { bg = c.hl_mint,   undercurl = true })

-- ---------------------------------------------------------------------------
-- Syntax — every highlight keeps fg = black, only bg differs.
-- The mapping is borrowed from Gruber Darker:
--   yellow  -> functions
--   brown   -> strings
--   niagara -> keywords / types
--   quartz  -> constants
--   wisteria-> numbers / preproc
--   green   -> comments (yes, comments get the highlighter too)
--   red     -> errors / specials
-- ---------------------------------------------------------------------------
hi("Comment",      { fg = c.fg_dim, bg = c.hl_green, italic = true })

hi("Constant",     { fg = c.fg, bg = c.hl_mint })
hi("String",       { fg = c.fg, bg = c.hl_orange })
hi("Character",    { fg = c.fg, bg = c.hl_orange })
hi("Number",       { fg = c.fg, bg = c.hl_purple })
hi("Float",        { fg = c.fg, bg = c.hl_purple })
hi("Boolean",      { fg = c.fg, bg = c.hl_mint, bold = true })

hi("Identifier",   { fg = c.fg })
hi("Function",     { fg = c.fg, bg = c.hl_yellow, bold = true })

hi("Statement",    { fg = c.fg, bg = c.hl_blue, bold = true })
hi("Conditional",  { fg = c.fg, bg = c.hl_blue, bold = true })
hi("Repeat",       { fg = c.fg, bg = c.hl_blue, bold = true })
hi("Label",        { fg = c.fg, bg = c.hl_blue })
hi("Operator",     { fg = c.fg })
hi("Keyword",      { fg = c.fg, bg = c.hl_blue, bold = true })
hi("Exception",    { fg = c.fg, bg = c.hl_red,  bold = true })

hi("PreProc",      { fg = c.fg, bg = c.hl_purple })
hi("Include",      { fg = c.fg, bg = c.hl_purple, bold = true })
hi("Define",       { fg = c.fg, bg = c.hl_purple, bold = true })
hi("Macro",        { fg = c.fg, bg = c.hl_purple })
hi("PreCondit",    { fg = c.fg, bg = c.hl_purple })

hi("Type",         { fg = c.fg, bg = c.hl_blue })
hi("StorageClass", { fg = c.fg, bg = c.hl_blue, italic = true })
hi("Structure",    { fg = c.fg, bg = c.hl_blue })
hi("Typedef",      { fg = c.fg, bg = c.hl_blue })

hi("Special",      { fg = c.fg, bg = c.hl_pink })
hi("SpecialChar",  { fg = c.fg, bg = c.hl_pink })
hi("Tag",          { fg = c.fg, bg = c.hl_blue })
hi("Delimiter",    { fg = c.fg })
hi("SpecialComment",{fg = c.fg, bg = c.hl_green, bold = true })
hi("Debug",        { fg = c.fg, bg = c.hl_red })

hi("Underlined",   { fg = c.fg, underline = true })
hi("Ignore",       { fg = c.fg_faint })
hi("Error",        { fg = c.fg, bg = c.hl_red, bold = true })
hi("Todo",         { fg = c.fg, bg = c.hl_yellow, bold = true })

-- ---------------------------------------------------------------------------
-- Treesitter
-- ---------------------------------------------------------------------------
hi("@comment",              { link = "Comment" })
hi("@comment.documentation",{ fg = c.fg, bg = c.hl_green, italic = true })
hi("@comment.todo",         { link = "Todo" })
hi("@comment.warning",      { fg = c.fg, bg = c.hl_orange, bold = true })
hi("@comment.error",        { fg = c.fg, bg = c.hl_red, bold = true })
hi("@comment.note",         { fg = c.fg, bg = c.hl_mint, bold = true })

hi("@string",               { link = "String" })
hi("@string.escape",        { fg = c.fg, bg = c.hl_pink })
hi("@string.special",       { fg = c.fg, bg = c.hl_pink })
hi("@string.regexp",        { fg = c.fg, bg = c.hl_pink })
hi("@character",            { link = "Character" })

hi("@number",               { link = "Number" })
hi("@number.float",         { link = "Float" })
hi("@boolean",              { link = "Boolean" })

hi("@constant",             { link = "Constant" })
hi("@constant.builtin",     { fg = c.fg, bg = c.hl_mint, bold = true })
hi("@constant.macro",       { fg = c.fg, bg = c.hl_purple })

hi("@variable",             { fg = c.fg })
hi("@variable.builtin",     { fg = c.fg, bg = c.hl_mint, italic = true })
hi("@variable.parameter",   { fg = c.fg, bg = c.hl_yellow })
hi("@variable.member",      { fg = c.fg })

hi("@function",             { link = "Function" })
hi("@function.builtin",     { fg = c.fg, bg = c.hl_yellow, italic = true })
hi("@function.call",        { fg = c.fg, bg = c.hl_yellow })
hi("@function.macro",       { fg = c.fg, bg = c.hl_purple, bold = true })
hi("@function.method",      { fg = c.fg, bg = c.hl_yellow, bold = true })
hi("@function.method.call", { fg = c.fg, bg = c.hl_yellow })
hi("@constructor",          { fg = c.fg, bg = c.hl_yellow, bold = true })

hi("@keyword",              { link = "Keyword" })
hi("@keyword.function",     { fg = c.fg, bg = c.hl_blue, bold = true })
hi("@keyword.operator",     { fg = c.fg, bg = c.hl_blue })
hi("@keyword.return",       { fg = c.fg, bg = c.hl_blue, bold = true })
hi("@keyword.import",       { link = "Include" })
hi("@keyword.conditional",  { link = "Conditional" })
hi("@keyword.repeat",       { link = "Repeat" })
hi("@keyword.exception",    { link = "Exception" })

hi("@type",                 { link = "Type" })
hi("@type.builtin",         { fg = c.fg, bg = c.hl_blue, italic = true })
hi("@type.definition",      { link = "Typedef" })
hi("@attribute",            { fg = c.fg, bg = c.hl_purple })
hi("@property",             { fg = c.fg })
hi("@field",                { fg = c.fg })

hi("@operator",             { link = "Operator" })
hi("@punctuation.delimiter",{ fg = c.fg })
hi("@punctuation.bracket",  { fg = c.fg })
hi("@punctuation.special",  { fg = c.fg, bg = c.hl_pink })

hi("@tag",                  { link = "Tag" })
hi("@tag.attribute",        { fg = c.fg, bg = c.hl_yellow })
hi("@tag.delimiter",        { fg = c.fg })

hi("@markup.heading",       { fg = c.fg, bg = c.hl_yellow, bold = true })
hi("@markup.strong",        { fg = c.fg, bold = true })
hi("@markup.italic",        { fg = c.fg, italic = true })
hi("@markup.underline",     { fg = c.fg, underline = true })
hi("@markup.strikethrough", { fg = c.fg, strikethrough = true })
hi("@markup.link",          { fg = c.fg, bg = c.hl_blue, underline = true })
hi("@markup.link.url",      { fg = c.fg, bg = c.hl_blue, underline = true })
hi("@markup.raw",           { fg = c.fg, bg = c.hl_mint })
hi("@markup.list",          { fg = c.fg, bg = c.hl_pink })
hi("@markup.quote",         { fg = c.fg_dim, bg = c.hl_green, italic = true })

-- ---------------------------------------------------------------------------
-- LSP / Diagnostics
-- ---------------------------------------------------------------------------
hi("DiagnosticError",     { fg = c.ink_red })
hi("DiagnosticWarn",      { fg = c.fg })
hi("DiagnosticInfo",      { fg = c.ink_blue })
hi("DiagnosticHint",      { fg = c.ink_green })
hi("DiagnosticOk",        { fg = c.ink_green })

hi("DiagnosticUnderlineError", { sp = c.ink_red,   undercurl = true })
hi("DiagnosticUnderlineWarn",  { sp = "#a86b00",   undercurl = true })
hi("DiagnosticUnderlineInfo",  { sp = c.ink_blue,  undercurl = true })
hi("DiagnosticUnderlineHint",  { sp = c.ink_green, undercurl = true })

hi("DiagnosticVirtualTextError", { fg = c.fg, bg = c.hl_red })
hi("DiagnosticVirtualTextWarn",  { fg = c.fg, bg = c.hl_orange })
hi("DiagnosticVirtualTextInfo",  { fg = c.fg, bg = c.hl_blue })
hi("DiagnosticVirtualTextHint",  { fg = c.fg, bg = c.hl_mint })

hi("LspReferenceText",    { bg = c.hl_yellow })
hi("LspReferenceRead",    { bg = c.hl_yellow })
hi("LspReferenceWrite",   { bg = c.hl_orange })
hi("LspSignatureActiveParameter", { fg = c.fg, bg = c.hl_yellow, bold = true })

-- ---------------------------------------------------------------------------
-- Diff / Git
-- ---------------------------------------------------------------------------
hi("DiffAdd",     { bg = c.hl_green })
hi("DiffChange",  { bg = c.hl_yellow })
hi("DiffDelete",  { bg = c.hl_red })
hi("DiffText",    { bg = c.hl_orange, bold = true })

hi("GitSignsAdd",    { fg = c.ink_green, bg = c.bg })
hi("GitSignsChange", { fg = "#a86b00",    bg = c.bg })
hi("GitSignsDelete", { fg = c.ink_red,   bg = c.bg })

hi("@diff.plus",  { bg = c.hl_green })
hi("@diff.minus", { bg = c.hl_red })
hi("@diff.delta", { bg = c.hl_yellow })
