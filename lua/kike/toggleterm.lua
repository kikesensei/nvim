local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
	return
end

toggleterm.setup {
  -- size can be a number or function which is passed to the current terminal
  -- size = function(term)
  --   if term.direction == "horizontal" then
  --     return 15
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,
	size = 13,

  open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "float", -- "vertical" | "tab" | "float"
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell

  -- This field is only relevant if direction is set to 'float'
	float_opts = {
	  border = "curved", -- "single" | "double" | "shadow"
    width = 160,
    height = 40,
	  winblend = 0,
	},
}

-- Function to set terminal window mappings
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- Set terminal window mappings
-- NOTE: If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Custom terminals
local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>g",
  "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
  { noremap = true, silent = true }
)

-- HTOP terminal
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
	htop:toggle()
end

-- Python terminal
local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  "<cmd>lua _PYTHON_TOGGLE()<CR>",
  { noremap = true, silent = true }
)
