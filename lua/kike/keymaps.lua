local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-k>", ":resize +2<CR>", opts)
keymap("n", "<C-S-j>", ":resize -2<CR>", opts)
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Set jk to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down --
keymap("n", "K", ":m .-2<CR>==", opts)
keymap("n", "J", ":m .+1<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Modify the copy-cut/paste behaviour
keymap("v", "p", '"_dP', opts)

-- Nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Turn off search highlighting until the next search
keymap("n", "<F3>", ":noh<cr>", opts)

-- Telescope
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)

-- Hop
keymap("n", "<leader><leader>p", ":HopPattern<cr>", opts)

-- Bufferline
keymap("n", "<leader><leader>c", ":bdelete<cr>", opts)

-- Null-ls
keymap("n", "<leader><leader>f", ":Format<cr>", opts)
