local wk = require("which-key")

-- Define key mappings with descriptions
local mappings = {
  -- Window management
  ['<leader><Down>'] = { '<cmd>resize -2<CR>', 'Decrease Height' },
  ['<leader><Left>'] = { '<cmd>vertical resize -2<CR>', 'Decrease Width' },
  ['<leader><Right>'] = { '<cmd>vertical resize +2<CR>', 'Increase Width' },
  ['<leader><S-Down>'] = { '<cmd>resize -5<CR>', 'Decrease Height (Shift)' },
  ['<leader><S-Left>'] = { '<cmd>vertical resize -5<CR>', 'Decrease Width (Shift)' },
  ['<leader><S-Right>'] = { '<cmd>vertical resize +5<CR>', 'Increase Width (Shift)' },
  ['<leader><S-Up>'] = { '<cmd>resize +5<CR>', 'Increase Height (Shift)' },
  ['<leader><Tab>'] = { '<cmd>NvimTreeToggle<CR>', 'Toggle NvimTree' },
  ['<leader><Up>'] = { '<cmd>resize +2<CR>', 'Increase Height' },

  -- Buffers
  ['<leader>b'] = { name = 'Buffers' },
  ['<leader>bd'] = { '<cmd>bd<CR>', 'Delete Buffer' },
  ['<leader>bl'] = { '<cmd>b#<CR>', 'Last Buffer' },
  ['<leader>bn'] = { '<cmd>bnext<CR>', 'Next Buffer' },
  ['<leader>bp'] = { '<cmd>bprev<CR>', 'Previous Buffer' },

  -- Telescope
  ['<leader>f'] = { name = 'Telescope' },
  ['<leader>fb'] = { '<cmd>Telescope buffers<CR>', 'Buffers' },
  ['<leader>ff'] = { '<cmd>Telescope find_files<CR>', 'Find Files' },
  ['<leader>fg'] = { '<cmd>Telescope live_grep<CR>', 'Live Grep' },
  ['<leader>fh'] = { '<cmd>Telescope help_tags<CR>', 'Help Tags' },

  -- KOSTelnet
  ['<leader>k'] = { name = 'KOSTelnet' },
  ['<leader>kt'] = { '<cmd>ToggleKOSTelnet 127.0.0.1<CR>', 'Toggle KOSTelnet' },

  -- Split management
  ['<leader>s'] = { name = 'Split' },
  ['<leader>sc'] = { '<cmd>close<CR>', 'Close Split' },
  ['<leader>sh'] = { '<cmd>split<CR>', 'Horizontal Split' },
  ['<leader>sv'] = { '<cmd>vsplit<CR>', 'Vertical Split' },

  -- Terminal
  ['<leader>t'] = { name = 'Terminal' },
  ['<leader>tt'] = { '<cmd>ToggleTerm<CR>', 'Toggle Term' },

  -- Window navigation
  ['<leader>w'] = { name = 'Window' },
  ['<leader>wh'] = { '<C-w>h', 'Move Left' },
  ['<leader>wj'] = { '<C-w>j', 'Move Down' },
  ['<leader>wk'] = { '<C-w>k', 'Move Up' },
  ['<leader>wl'] = { '<C-w>l', 'Move Right' },
}

-- Register the mappings with which-key
wk.register(mappings)
