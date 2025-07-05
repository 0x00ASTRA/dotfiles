-- lua/plugins/which-key.lua
local wk = require("which-key")


-- Add your Normal mode mappings
wk.add({
  -- Window Management
  { '<leader><Down>', '<cmd>resize -2<CR>', desc = 'Decrease Height' },
  { '<leader><Left>', '<cmd>vertical resize -2<CR>', desc = 'Decrease Width' },
  { '<leader><Right>', '<cmd>vertical resize +2<CR>', desc = 'Increase Width' },
  { '<leader><S-Down>', '<cmd>resize -5<CR>', desc = 'Decrease Height (Shift)' },
  { '<leader><S-Left>', '<cmd>vertical resize -5<CR>', desc = 'Decrease Width (Shift)' },
  { '<leader><S-Right>', '<cmd>vertical resize +5<CR>', desc = 'Increase Width (Shift)' },
  { '<leader><S-Up>', '<cmd>resize +5<CR>', desc = 'Increase Height (Shift)' },
  { '<leader><Tab>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
  { '<leader><Up>', '<cmd>resize +2<CR>', desc = 'Increase Height' },

  -- Buffers Group
  { '<leader>b', group = 'Buffers' },
  { '<leader>bd', '<cmd>bd<CR>', desc = 'Delete Buffer' },
  { '<leader>bl', '<cmd>b#<CR>', desc = 'Last Buffer' },
  { '<leader>bn', '<cmd>bnext<CR>', desc = 'Next Buffer' },
  { '<leader>bp', '<cmd>bprev<CR>', desc = 'Previous Buffer' },

  -- Telescope Group
  { '<leader>f', group = 'Telescope' },
  { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
  { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
  { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
  { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help Tags' },

  -- Split Management Group
  { '<leader>s', group = 'Split' },
  { '<leader>sc', '<cmd>close<CR>', desc = 'Close Split' },
  { '<leader>sh', '<cmd>split<CR>', desc = 'Horizontal Split' },
  { '<leader>sv', '<cmd>vsplit<CR>', desc = 'Vertical Split' },

  -- Terminal Group
  { '<leader>t', group = 'Terminal' },
  { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = 'Toggle Term' },

  -- Window Navigation Group
  { '<leader>w', group = 'Window' },
  { '<leader>wh', '<C-w>h', desc = 'Move Left' },
  { '<leader>wj', '<C-w>j', desc = 'Move Down' },
  { '<leader>wk', '<C-w>k', desc = 'Move Up' },
  { '<leader>wl', '<C-w>l', desc = 'Move Right' },
})

-- Add the Terminal mode specific mapping
wk.add({
  { '<Esc>', '<C-\\><C-n>', desc = 'Exit Terminal Mode', mode = 't' },
  -- If you also want '<leader>t' to appear in which-key when in terminal mode,
  -- you would add it here with its 't' mode specific action:
  -- { '<leader>t', [[<C-\><C-N><cmd>ToggleTerm<cr>]], desc = 'Toggle Terminal', mode = 't' },
})
