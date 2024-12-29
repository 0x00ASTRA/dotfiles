local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- NvimTree
map('n', '<leader><Tab>', '<cmd>NvimTreeToggle<cr>', opts)

-- ToggleTerm
map('n', '<leader>t', '<cmd>ToggleTerm<cr>', opts)
map('t', '<leader>t', [[<C-\><C-N><cmd>ToggleTerm<cr>]], opts)  -- Terminal mode mapping

-- KOSTelnet
map('n', '<leader>kt', '<cmd>ToggleKOSTelnet 127.0.0.1<CR>', opts)
map('t', '<leader>kt', [[<C-\><C-N><cmd>ToggleKOSTelnet<cr>]], opts)  -- Terminal mode mapping

-- Buffer management
map('n', '<leader>bn', ':bnext<cr>', opts)  -- Next buffer
map('n', '<leader>bp', ':bprev<cr>', opts)  -- Previous buffer
map('n', '<leader>bd', ':bdelete<cr>', opts)  -- Delete current buffer
map('n', '<leader>bl', ':blast<cr>', opts)  -- Last buffer

-- Window tiling and navigation
map('n', '<leader>sv', '<cmd>vsplit<cr>', opts)  -- Vertical split
map('n', '<leader>sh', '<cmd>split<cr>', opts)   -- Horizontal split
map('n', '<leader>sc', '<cmd>close<cr>', opts)   -- Close current split/window

-- Resizing windows
map('n', '<leader><Up>', ':resize +2<cr>', opts)   -- Increase window height
map('n', '<leader><Down>', ':resize -2<cr>', opts)  -- Decrease window height
map('n', '<leader><Left>', ':vertical resize -2<cr>', opts) -- Decrease window width
map('n', '<leader><Right>', ':vertical resize +2<cr>', opts) -- Increase window width

-- Navigation between windows
map('n', '<leader>wh', '<C-w>h', opts)  -- Move to left window
map('n', '<leader>wj', '<C-w>j', opts)  -- Move to bottom window
map('n', '<leader>wk', '<C-w>k', opts)  -- Move to top window
map('n', '<leader>wl', '<C-w>l', opts)  -- Move to right window

-- Resize current window with shift+arrows (alternative to arrow resizing)
map('n', '<S-Up>', ':resize +2<cr>', opts)
map('n', '<S-Down>', ':resize -2<cr>', opts)
map('n', '<S-Left>', ':vertical resize -2<cr>', opts)
map('n', '<S-Right>', ':vertical resize +2<cr>', opts)
