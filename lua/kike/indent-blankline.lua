local status_ok, indent_blankline = pcall(require, "indent_blankline")

if not status_ok then
	return
end

-- Specifies a list of buftype values for which this plugin is not enabled
vim.g.indent_blankline_buftype_exclude = {
  "terminal",
  "nofile",
  "quickfix",
  "prompt",
}

-- Specifies a list of filetype values for which this plugin is not enabled.
vim.g.indent_blankline_filetype_exclude = {
  "lspinfo",
  "packer",
  "checkhealth",
  "help",
  "man",
  "",
	"NvimTree",
}

-- Turns this plugin on or off
vim.g.indentLine_enabled = true

-- Specifies a list of lua patterns that are used to match against the
-- treesitter tsnode:type() at the cursor position to find the current
-- context.
-- NOTE: Only used when show_current_context is active
vim.g.indent_blankline_context_patterns = {
  "class",
  "^func",
  "method",
  "^if",
  "while",
  "for",
  "with",
  "try",
  "except",
  "arguments",
  "argument_list",
  "object",
  "dictionary",
  "element",
  "table",
  "tuple",
  "do_block",
}

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#6C71C4 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#CB4B16 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#B58900 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#D33682 gui=nocombine]]

vim.opt.list = false
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

indent_blankline.setup({
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  show_current_context_start = false,

  -- Specifies the character to be used as indent line.
  char = "",
  -- char = "│",
  -- char = "▏",
  -- char = "▎",

  show_first_indent_level = true,
  use_treesitter = true,
  show_end_of_line = false,
  space_char_blankline = " ",

	char_highlight_list = {
    "IndentBlanklineIndent1",
	  "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
	},

  -- Displays a trailing indentation guide on blank lines, to match the
  -- indentation of surrounding code.
  -- NOTE: Turn this off if you want to use background highlighting instead of chars.
  show_trailing_blankline_indent = false,
})
