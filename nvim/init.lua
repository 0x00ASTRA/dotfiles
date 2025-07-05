-- ~/.config/nvim/init.lua

--package.cpath = package.cpath .. ";/usr/lib/lua/5.1/?.so"

vim.opt.rtp:append("~/.config/nvim/astraeus")

-- Add your config folder to package.path
package.path = package.path .. ";/home/astra/.config/nvim/?.lua;/home/astra/.config/nvim/?/init.lua"

require('astraeus.plugins')
require('astraeus.settings')
require('astraeus.keymaps')
require('astraeus.lsp')
require('astraeus.treesitter-config')
require('astraeus.format')
require('astraeus.pluginsconfig')
require('astraeus.whichkeyconfig')
