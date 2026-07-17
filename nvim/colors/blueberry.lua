-- Blueberry Dark Theme for Neovim (All Hex Values Checked)

local blueberry = {
	bg = "#242938", -- editor.background
	bg_dark = "#1d212f", -- sideBar.background / activityBar.background
	bg_darker = "#191d28", -- titleBar.activeBackground
	fg = "#a6accd", -- editor.foreground
	text_bright = "#e4f0fb", -- input.foreground / functions
	comment = "#506477", -- comment foreground
	punctuation = "#7390aa", -- operator / misc punctuation

	-- Accent Palette
	teal = "#32AE85", -- keywords / attributes
	cyan = "#27E8A7", -- constants / numbers / cursor
	ice_blue = "#add7ff", -- variables / JSON level 1
	sky_blue = "#91b4d5", -- types / sub-methods
	sea_foam = "#53beb2", -- strings
	red = "#ff5370", -- terminal red / error border
	pink = "#df4576", -- badge background
	yellow = "#ffcb6b", -- warning border
	blue = "#82aaff", -- info border

	-- Blended UI Elements
	selection = "#353d56", -- editor.selectionBackground
	line_hl = "#1c202c", -- editor.lineHighlightBackground
	diff_add = "#343d36", -- diffEditor.insertedTextBackground blended
	diff_rem = "#3b2e3c", -- diffEditor.removedTextBackground blended
	search_hl = "#2e424c", -- editor.selectionHighlightBackground blended
	float_border = "#404555", -- 30% white over bg_dark (#ffffff30 fixed)
}

-- Reset highlighting
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "blueberry"
vim.o.background = "dark"

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- --- UI Highlight Groups ---
hl("Normal", { fg = blueberry.fg, bg = blueberry.bg })
hl("NormalFloat", { fg = blueberry.fg, bg = blueberry.bg_dark })
hl("ColorColumn", { bg = blueberry.bg_dark })
hl("Cursor", { fg = blueberry.bg, bg = blueberry.cyan })
hl("CursorLine", { bg = blueberry.line_hl })
hl("CursorColumn", { bg = blueberry.line_hl })
hl("LineNr", { fg = "#3a3f58" }) -- editorLineNumber.foreground
hl("CursorLineNr", { fg = blueberry.cyan })

-- Float & Windows
hl("NormalNC", { fg = blueberry.fg, bg = blueberry.bg })
hl("FloatBorder", { fg = blueberry.float_border, bg = blueberry.bg_dark })
hl("VertSplit", { fg = "#191d28" })
hl("WinSeparator", { fg = "#191d28" })

-- Diff Layouts
hl("DiffAdd", { bg = blueberry.diff_add })
hl("DiffDelete", { bg = blueberry.diff_rem })
hl("DiffChange", { bg = blueberry.bg_dark })
hl("DiffText", { bg = blueberry.search_hl })

-- Menus and Selections
hl("Pmenu", { fg = blueberry.fg, bg = blueberry.bg_dark })
hl("PmenuSel", { fg = blueberry.sky_blue, bg = blueberry.bg_darker })
hl("PmenuSbar", { bg = "#11141b" })
hl("PmenuThumb", { bg = "#000000" })
hl("Visual", { bg = blueberry.selection })
hl("Search", { bg = blueberry.search_hl })
hl("IncSearch", { bg = blueberry.cyan, fg = blueberry.bg })

-- Tabs & Statusline
hl("TabLine", { fg = "#676e95", bg = blueberry.bg_dark })
hl("TabLineSel", { fg = blueberry.fg, bg = blueberry.bg })
hl("TabLineFill", { bg = blueberry.bg_darker })
hl("StatusLine", { fg = "#676e95", bg = blueberry.bg_dark })
hl("StatusLineNC", { fg = "#676e95", bg = blueberry.bg_darker })

-- --- Syntax Highlighting ---
hl("Comment", { fg = blueberry.comment, italic = true })
hl("Constant", { fg = blueberry.cyan })
hl("String", { fg = blueberry.sea_foam })
hl("Character", { fg = blueberry.cyan })
hl("Number", { fg = blueberry.cyan })
hl("Boolean", { fg = blueberry.cyan })
hl("Float", { fg = blueberry.cyan })

hl("Identifier", { fg = blueberry.ice_blue })
hl("Function", { fg = blueberry.text_bright })

hl("Statement", { fg = blueberry.teal })
hl("Conditional", { fg = blueberry.teal })
hl("Repeat", { fg = blueberry.teal })
hl("Label", { fg = blueberry.teal })
hl("Operator", { fg = blueberry.punctuation })
hl("Keyword", { fg = blueberry.teal, italic = true })
hl("Exception", { fg = blueberry.teal })

hl("PreProc", { fg = blueberry.teal })
hl("Include", { fg = blueberry.teal })
hl("Define", { fg = blueberry.teal })
hl("Macro", { fg = blueberry.teal })
hl("PreCondit", { fg = blueberry.teal })

hl("Type", { fg = blueberry.sky_blue })
hl("StorageClass", { fg = blueberry.teal })
hl("Structure", { fg = blueberry.teal })
hl("Typedef", { fg = blueberry.teal })

hl("Special", { fg = blueberry.cyan })
hl("SpecialChar", { fg = blueberry.teal })
hl("Tag", { fg = blueberry.text_bright })
hl("Delimiter", { fg = blueberry.punctuation })
hl("SpecialComment", { fg = "#42675A", italic = true })
hl("Debug", { fg = blueberry.pink })

hl("Underlined", { underline = true })
hl("Ignore", { fg = blueberry.comment })
hl("Error", { fg = blueberry.red, bold = true })
hl("Todo", { fg = blueberry.yellow, bold = true })

-- --- Tree-sitter Specifics (Modern Neovim parsing) ---
hl("@comment", { link = "Comment" })
hl("@variable", { fg = blueberry.ice_blue })
hl("@variable.builtin", { fg = blueberry.sky_blue, italic = true })
hl("@keyword", { link = "Keyword" })
hl("@function", { link = "Function" })
hl("@function.builtin", { fg = blueberry.text_bright })
hl("@function.call", { fg = blueberry.text_bright })
hl("@operator", { link = "Operator" })
hl("@punctuation.bracket", { fg = blueberry.punctuation })
hl("@punctuation.delimiter", { fg = blueberry.punctuation })
hl("@type", { link = "Type" })
hl("@type.builtin", { fg = blueberry.sky_blue })
hl("@property", { fg = blueberry.teal, italic = true })
hl("@field", { fg = blueberry.ice_blue })
hl("@constructor", { fg = blueberry.sky_blue })

-- --- Diagnostic & LSP Engine ---
hl("DiagnosticError", { fg = blueberry.red })
hl("DiagnosticWarn", { fg = blueberry.yellow })
hl("DiagnosticInfo", { fg = blueberry.blue })
hl("DiagnosticHint", { fg = blueberry.cyan })

hl("DiagnosticUnderlineError", { undercurl = true, sp = blueberry.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = blueberry.yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = blueberry.blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = blueberry.cyan })
