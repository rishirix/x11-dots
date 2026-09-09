-- Neovim colorscheme
-- Palette: 17BEBB, 2E282A, CD5334, EDB88B, FAD8D6
--
-- USAGE:
-- 1. Save this file as ~/.config/nvim/colors/rice.lua
-- 2. In your init.lua, add:  vim.cmd("colorscheme rice")
--    (or in init.vim:        colorscheme rice)
-- 3. Restart nvim

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "rice"

local c = {
  bg        = "#2e282a",
  bg_alt    = "#3a3335",
  bg_alt2   = "#5c5457",
  fg        = "#f5e4e1",
  fg_dim    = "#d9c7c4",
  teal      = "#17bebb",
  teal_br   = "#4fd4d1",
  red       = "#cd5334",
  red_br    = "#e2724f",
  peach     = "#edb88b",
  peach_br  = "#f5cba1",
  green     = "#7fb069",
  green_br  = "#9ecb85",
  blue      = "#3b6e8c",
  blue_br   = "#5a8fb0",
  magenta   = "#b5657a",
  magenta_br= "#d98a99",
  blush     = "#fad8d6",
  none      = "NONE",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal",       { fg = c.fg,      bg = c.bg })
hl("NormalFloat",  { fg = c.fg,      bg = c.bg_alt })
hl("Cursor",       { fg = c.bg,      bg = c.blush })
hl("CursorLine",   { bg = c.bg_alt })
hl("CursorLineNr", { fg = c.teal,    bold = true })
hl("LineNr",       { fg = c.bg_alt2 })
hl("SignColumn",   { fg = c.fg_dim,  bg = c.bg })
hl("Visual",       { bg = c.bg_alt2 })
hl("Search",       { fg = c.bg,      bg = c.peach })
hl("IncSearch",    { fg = c.bg,      bg = c.teal })
hl("Pmenu",        { fg = c.fg,      bg = c.bg_alt })
hl("PmenuSel",     { fg = c.bg,      bg = c.teal })
hl("StatusLine",   { fg = c.fg,      bg = c.bg_alt })
hl("StatusLineNC", { fg = c.fg_dim,  bg = c.bg })
hl("VertSplit",    { fg = c.bg_alt2, bg = c.bg })
hl("WinSeparator", { fg = c.bg_alt2, bg = c.bg })
hl("TabLine",      { fg = c.fg_dim,  bg = c.bg_alt })
hl("TabLineSel",   { fg = c.fg,      bg = c.bg_alt2 })
hl("TabLineFill",  { bg = c.bg })
hl("Directory",    { fg = c.teal })
hl("Title",        { fg = c.teal,    bold = true })
hl("MatchParen",   { fg = c.peach,   bold = true, underline = true })
hl("NonText",      { fg = c.bg_alt2 })
hl("Whitespace",   { fg = c.bg_alt2 })
hl("Folded",       { fg = c.fg_dim,  bg = c.bg_alt })
hl("FoldColumn",   { fg = c.bg_alt2, bg = c.bg })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn",  { fg = c.peach })
hl("DiagnosticInfo",  { fg = c.blue_br })
hl("DiagnosticHint",  { fg = c.green })

-- Diffs
hl("DiffAdd",    { fg = c.green,   bg = c.bg_alt })
hl("DiffChange", { fg = c.peach,   bg = c.bg_alt })
hl("DiffDelete", { fg = c.red,     bg = c.bg_alt })
hl("DiffText",   { fg = c.teal,    bg = c.bg_alt })

-- Syntax
hl("Comment",      { fg = c.bg_alt2, italic = true })
hl("Constant",     { fg = c.peach })
hl("String",       { fg = c.green })
hl("Character",    { fg = c.green })
hl("Number",       { fg = c.peach_br })
hl("Boolean",      { fg = c.peach_br })
hl("Float",        { fg = c.peach_br })
hl("Identifier",   { fg = c.fg })
hl("Function",     { fg = c.teal,    bold = true })
hl("Statement",    { fg = c.red,     bold = true })
hl("Conditional",  { fg = c.red })
hl("Repeat",       { fg = c.red })
hl("Label",        { fg = c.red })
hl("Operator",     { fg = c.fg_dim })
hl("Keyword",      { fg = c.magenta_br, bold = true })
hl("Exception",    { fg = c.red })
hl("PreProc",      { fg = c.blue_br })
hl("Include",      { fg = c.blue_br })
hl("Define",       { fg = c.blue_br })
hl("Macro",        { fg = c.blue_br })
hl("Type",         { fg = c.blue_br })
hl("StorageClass", { fg = c.blue_br })
hl("Structure",    { fg = c.blue_br })
hl("Typedef",      { fg = c.blue_br })
hl("Special",      { fg = c.magenta })
hl("Underlined",   { fg = c.teal,    underline = true })
hl("Error",        { fg = c.fg,      bg = c.red })
hl("Todo",         { fg = c.bg,      bg = c.peach, bold = true })

-- Treesitter (common groups)
hl("@variable",         { fg = c.fg })
hl("@function",          { link = "Function" })
hl("@keyword",           { link = "Keyword" })
hl("@string",            { link = "String" })
hl("@comment",           { link = "Comment" })
hl("@type",              { link = "Type" })
hl("@constant",          { link = "Constant" })
hl("@property",          { fg = c.fg_dim })
hl("@punctuation",       { fg = c.fg_dim })
hl("@tag",               { fg = c.red })
hl("@tag.attribute",     { fg = c.peach })
